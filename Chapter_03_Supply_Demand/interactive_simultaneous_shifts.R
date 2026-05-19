#!/usr/bin/env Rscript
# Interactive Plotly diagram for simultaneous demand and supply shifts
# Creates standalone HTML file you can open during class

library(plotly)
library(htmlwidgets)
library(dplyr)

cat("Creating interactive simultaneous shifts diagram...\n")

# Helper functions
create_supply <- function(intercept, slope = 0.15) {
  Q <- seq(5, 18, by = 0.1)
  P <- intercept + slope * Q
  data.frame(Q = Q, P = P)
}

create_demand <- function(intercept, slope = -0.15) {
  Q <- seq(5, 18, by = 0.1)
  P <- intercept + slope * Q
  data.frame(Q = Q, P = P)
}

find_equilibrium <- function(d_intercept, s_intercept, d_slope = -0.15, s_slope = 0.15) {
  # Solve: d_intercept + d_slope*Q = s_intercept + s_slope*Q
  Q <- (s_intercept - d_intercept) / (d_slope - s_slope)
  P <- d_intercept + d_slope * Q
  list(Q = Q, P = P)
}

# Base curves
demand_0 <- create_demand(2.5)
supply_0 <- create_supply(-0.5)
eq_0 <- find_equilibrium(2.5, -0.5)

# Create multiple scenarios with different shift magnitudes
scenarios <- list(
  list(name = "Large Demand ↑, Small Supply ↑",
       d_int = 3.5, s_int = -0.3,
       result = "P ↑↑, Q ↑"),

  list(name = "Small Demand ↑, Large Supply ↑",
       d_int = 2.8, s_int = 0.2,
       result = "P ↓, Q ↑↑"),

  list(name = "Equal Shifts (Both ↑)",
       d_int = 3.0, s_int = 0.0,
       result = "P ?, Q ↑"),

  list(name = "Demand ↑, Supply ↓",
       d_int = 3.2, s_int = -0.8,
       result = "P ↑↑↑, Q ?"),

  list(name = "Demand ↓, Supply ↑",
       d_int = 2.0, s_int = 0.3,
       result = "P ↓↓↓, Q ?")
)

# Build plotly figure with buttons for each scenario
fig <- plot_ly() %>%
  # Original curves (always visible)
  add_lines(data = demand_0, x = ~Q, y = ~P,
            name = "D₀ (original)",
            line = list(color = "#424242", dash = "dash", width = 2),
            visible = TRUE) %>%
  add_lines(data = supply_0, x = ~Q, y = ~P,
            name = "S₀ (original)",
            line = list(color = "#009688", dash = "dash", width = 2),
            visible = TRUE) %>%
  # Original equilibrium
  add_markers(x = eq_0$Q, y = eq_0$P,
              name = "E₀",
              marker = list(color = "#999", size = 12),
              visible = TRUE) %>%
  add_annotations(x = eq_0$Q, y = eq_0$P,
                  text = sprintf("E₀<br>(%.1f, $%.2f)", eq_0$Q, eq_0$P),
                  showarrow = TRUE,
                  arrowhead = 2,
                  ax = -40, ay = -40,
                  visible = TRUE)

# Add traces for first scenario (initially visible)
demand_1 <- create_demand(scenarios[[1]]$d_int)
supply_1 <- create_supply(scenarios[[1]]$s_int)
eq_1 <- find_equilibrium(scenarios[[1]]$d_int, scenarios[[1]]$s_int)

fig <- fig %>%
  add_lines(data = demand_1, x = ~Q, y = ~P,
            name = "D₁ (new)",
            line = list(color = "#424242", width = 3),
            visible = TRUE) %>%
  add_lines(data = supply_1, x = ~Q, y = ~P,
            name = "S₁ (new)",
            line = list(color = "#009688", width = 3),
            visible = TRUE) %>%
  add_markers(x = eq_1$Q, y = eq_1$P,
              name = "E₁",
              marker = list(color = "#009688", size = 14),
              visible = TRUE) %>%
  add_annotations(x = eq_1$Q, y = eq_1$P,
                  text = sprintf("E₁<br>(%.1f, $%.2f)", eq_1$Q, eq_1$P),
                  showarrow = TRUE,
                  arrowhead = 2,
                  ax = 40, ay = -40,
                  font = list(color = "#009688", size = 14, weight = "bold"),
                  visible = TRUE)

# Create buttons for scenario switching
buttons <- list()

for (i in seq_along(scenarios)) {
  s <- scenarios[[i]]
  d_new <- create_demand(s$d_int)
  s_new <- create_supply(s$s_int)
  eq_new <- find_equilibrium(s$d_int, s$s_int)

  # Visibility array: first 3 always visible (D₀, S₀, E₀), then scenario-specific
  vis <- c(TRUE, TRUE, TRUE, rep(FALSE, length(scenarios) * 4))
  vis[3 + (i-1)*4 + 1] <- TRUE  # D₁
  vis[3 + (i-1)*4 + 2] <- TRUE  # S₁
  vis[3 + (i-1)*4 + 3] <- TRUE  # E₁
  vis[3 + (i-1)*4 + 4] <- TRUE  # E₁ annotation

  buttons[[i]] <- list(
    method = "restyle",
    args = list("visible", vis),
    label = sprintf("%s → %s", s$name, s$result)
  )
}

# Add all scenario traces (initially hidden)
for (i in 2:length(scenarios)) {
  s <- scenarios[[i]]
  d_new <- create_demand(s$d_int)
  s_new <- create_supply(s$s_int)
  eq_new <- find_equilibrium(s$d_int, s$s_int)

  fig <- fig %>%
    add_lines(data = d_new, x = ~Q, y = ~P,
              name = "D₁", line = list(color = "#424242", width = 3),
              visible = FALSE, showlegend = FALSE) %>%
    add_lines(data = s_new, x = ~Q, y = ~P,
              name = "S₁", line = list(color = "#009688", width = 3),
              visible = FALSE, showlegend = FALSE) %>%
    add_markers(x = eq_new$Q, y = eq_new$P,
                marker = list(color = "#009688", size = 14),
                visible = FALSE, showlegend = FALSE) %>%
    add_annotations(x = eq_new$Q, y = eq_new$P,
                    text = sprintf("E₁<br>(%.1f, $%.2f)", eq_new$Q, eq_new$P),
                    showarrow = TRUE, arrowhead = 2,
                    ax = 40, ay = -40,
                    font = list(color = "#009688", size = 14),
                    visible = FALSE)
}

# Layout with dropdown menu
fig <- fig %>%
  layout(
    title = list(
      text = "<b>Interactive: Simultaneous Demand & Supply Shifts</b><br><sub>Click buttons to see different scenarios</sub>",
      font = list(size = 20)
    ),
    xaxis = list(
      title = "Quantity",
      range = c(5, 18),
      showgrid = TRUE,
      gridcolor = "#f0f0f0"
    ),
    yaxis = list(
      title = "Price",
      range = c(0, 3.5),
      showgrid = TRUE,
      gridcolor = "#f0f0f0",
      tickprefix = "$"
    ),
    updatemenus = list(
      list(
        type = "buttons",
        direction = "down",
        xanchor = "left",
        yanchor = "top",
        x = 0.02,
        y = 0.98,
        buttons = buttons,
        bgcolor = "#f8f9fa",
        bordercolor = "#009688",
        borderwidth = 2
      )
    ),
    plot_bgcolor = "white",
    paper_bgcolor = "white",
    font = list(family = "Arial, sans-serif", size = 12),
    showlegend = TRUE,
    legend = list(x = 0.7, y = 0.98)
  )

# Save as standalone HTML
saveWidget(fig,
           "interactive_simultaneous_shifts.html",
           selfcontained = TRUE,
           title = "Interactive: Simultaneous Shifts")

cat("✅ Interactive diagram created!\n\n")
cat("File: interactive_simultaneous_shifts.html\n")
cat("Usage: Open this HTML file in your browser during class.\n")
cat("       Click buttons to show different shift scenarios.\n\n")
cat("In presentation, add a note:\n")
cat("  'See interactive demo: interactive_simultaneous_shifts.html'\n")
