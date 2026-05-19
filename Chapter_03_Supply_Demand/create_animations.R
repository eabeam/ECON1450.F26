#!/usr/bin/env Rscript
# Create animated GIFs for supply and demand concepts

library(ggplot2)
library(gganimate)
library(dplyr)
library(scales)

# Ensure images directory exists
dir.create("images", showWarnings = FALSE)

# Color palette (match presentation)
col_demand <- "#424242"
col_supply <- "#009688"
col_equilibrium <- "#009688"

# Theme
theme_modern_econ <- function(base_size = 14) {
  theme_minimal(base_size = base_size) +
    theme(
      plot.title = element_text(hjust = 0.5, face = "bold", size = rel(1.2), color = "#424242"),
      plot.background = element_rect(fill = "white", color = NA),
      panel.background = element_rect(fill = "white", color = NA),
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(color = "#F0F0F0", linewidth = 0.3),
      axis.line = element_line(color = "#424242", linewidth = 0.6),
      axis.text = element_text(size = rel(0.95), color = "#424242"),
      axis.title = element_text(size = rel(1), face = "plain", color = "#424242"),
      legend.position = "none",
      plot.margin = margin(10, 10, 10, 10)
    )
}

# Helper functions
create_supply <- function(intercept = -0.5, slope = 0.15, Q_range = c(7, 15)) {
  data.frame(Q = seq(Q_range[1], Q_range[2], by = 0.05)) %>%
    mutate(P = intercept + slope * Q)
}

create_demand <- function(intercept = 2.5, slope = -0.15, Q_range = c(7, 15)) {
  data.frame(Q = seq(Q_range[1], Q_range[2], by = 0.05)) %>%
    mutate(P = intercept + slope * Q)
}

cat("Creating animated GIFs...\n\n")

# ============================================================================
# 1. DEMAND INCREASE ANIMATION
# ============================================================================
cat("1. Demand increase animation...")

n_frames <- 40
supply_std <- create_supply()

demand_shift_frames <- expand.grid(
  Q = seq(7, 15, by = 0.1),
  frame = 1:n_frames
) %>%
  mutate(
    # Smoothly shift intercept from 2.5 to 3.0
    intercept = 2.5 + (frame/n_frames) * 0.5,
    P = intercept - 0.15 * Q,
    # Calculate equilibrium for each frame
    eq_Q = (intercept - (-0.5)) / (0.15 + 0.15),
    eq_P = -0.5 + 0.15 * eq_Q
  )

# Get equilibrium points for animation
eq_points <- demand_shift_frames %>%
  group_by(frame) %>%
  slice(1) %>%
  select(frame, eq_Q, eq_P)

p1 <- ggplot() +
  geom_line(data = supply_std, aes(x = Q, y = P),
            color = col_supply, linewidth = 1.3) +
  geom_line(data = demand_shift_frames, aes(x = Q, y = P),
            color = col_demand, linewidth = 1.3) +
  geom_point(data = eq_points, aes(x = eq_Q, y = eq_P),
             color = col_equilibrium, size = 4) +
  annotate("text", x = 13, y = 1.9, label = "S",
           color = col_supply, size = 6, fontface = "bold") +
  scale_x_continuous(name = "Quantity",
                     limits = c(7, 15), expand = c(0, 0)) +
  scale_y_continuous(name = "Price",
                     limits = c(0.45, 2.1), labels = dollar, expand = c(0, 0)) +
  labs(title = "Demand Increases") +
  theme_modern_econ() +
  transition_manual(frame)

anim_save("images/demand_increase.gif", p1,
          width = 700, height = 450, fps = 20, duration = 4)

cat(" ✓\n")

# ============================================================================
# 2. SUPPLY DECREASE ANIMATION
# ============================================================================
cat("2. Supply decrease animation...")

demand_std <- create_demand()

supply_shift_frames <- expand.grid(
  Q = seq(7, 15, by = 0.1),
  frame = 1:n_frames
) %>%
  mutate(
    # Shift intercept from -0.5 to -0.1 (leftward shift)
    intercept = -0.5 + (frame/n_frames) * 0.4,
    P = intercept + 0.15 * Q,
    # Calculate equilibrium
    eq_Q = (2.5 - intercept) / (0.15 + 0.15),
    eq_P = 2.5 - 0.15 * eq_Q
  )

eq_points2 <- supply_shift_frames %>%
  group_by(frame) %>%
  slice(1) %>%
  select(frame, eq_Q, eq_P)

p2 <- ggplot() +
  geom_line(data = demand_std, aes(x = Q, y = P),
            color = col_demand, linewidth = 1.3) +
  geom_line(data = supply_shift_frames, aes(x = Q, y = P),
            color = col_supply, linewidth = 1.3) +
  geom_point(data = eq_points2, aes(x = eq_Q, y = eq_P),
             color = col_equilibrium, size = 4) +
  annotate("text", x = 13, y = 0.85, label = "D",
           color = col_demand, size = 6, fontface = "bold") +
  scale_x_continuous(name = "Quantity",
                     limits = c(7, 15), expand = c(0, 0)) +
  scale_y_continuous(name = "Price",
                     limits = c(0.45, 2.1), labels = dollar, expand = c(0, 0)) +
  labs(title = "Supply Decreases") +
  theme_modern_econ() +
  transition_manual(frame)

anim_save("images/supply_decrease.gif", p2,
          width = 700, height = 450, fps = 20, duration = 4)

cat(" ✓\n")

# ============================================================================
# 3. SHORTAGE ADJUSTMENT ANIMATION
# ============================================================================
cat("3. Shortage adjustment animation...")

shortage_frames <- data.frame(frame = 1:n_frames) %>%
  mutate(
    # Price rises from 0.75 to 1.00 (equilibrium)
    price = 0.75 + (frame/n_frames) * 0.25,
    Qd = 2.5 - 0.15 * (seq(7, 15, length.out = n_frames)),
    Qs = -0.5 + 0.15 * (seq(7, 15, length.out = n_frames))
  )

# For each frame, calculate Qd and Qs at that price
shortage_data <- expand.grid(
  Q = seq(7, 15, by = 0.1),
  frame = 1:n_frames
) %>%
  mutate(
    price = 0.75 + (frame/n_frames) * 0.25,
    # Calculate Qd and Qs at this price
    Qd_at_price = (2.5 - price) / 0.15,
    Qs_at_price = (price + 0.5) / 0.15
  )

p3 <- ggplot() +
  geom_line(data = supply_std, aes(x = Q, y = P),
            color = col_supply, linewidth = 1.3) +
  geom_line(data = demand_std, aes(x = Q, y = P),
            color = col_demand, linewidth = 1.3) +
  geom_hline(data = shortage_data %>% group_by(frame) %>% slice(1),
             aes(yintercept = price),
             linetype = "dashed", color = "#E57373", linewidth = 0.8) +
  geom_point(data = shortage_data %>% group_by(frame) %>% slice(1),
             aes(x = Qs_at_price, y = price),
             color = col_supply, size = 4) +
  geom_point(data = shortage_data %>% group_by(frame) %>% slice(1),
             aes(x = Qd_at_price, y = price),
             color = col_demand, size = 4) +
  scale_x_continuous(name = "Quantity",
                     limits = c(7, 15), expand = c(0, 0)) +
  scale_y_continuous(name = "Price",
                     limits = c(0.45, 2.1), labels = dollar, expand = c(0, 0)) +
  labs(title = "Shortage → Price Rises to Equilibrium") +
  theme_modern_econ() +
  transition_manual(frame)

anim_save("images/shortage_adjustment.gif", p3,
          width = 700, height = 450, fps = 15, duration = 5)

cat(" ✓\n")

# ============================================================================
# 4. MOVEMENT ALONG DEMAND CURVE
# ============================================================================
cat("4. Movement along demand curve...")

movement_frames <- data.frame(frame = 1:n_frames) %>%
  mutate(
    # Price falls from 1.5 to 0.5
    price = 1.5 - (frame/n_frames) * 1.0,
    quantity = (2.5 - price) / 0.15
  )

p4 <- ggplot() +
  geom_line(data = demand_std, aes(x = Q, y = P),
            color = col_demand, linewidth = 1.5) +
  geom_point(data = movement_frames, aes(x = quantity, y = price),
             color = "#E57373", size = 5) +
  geom_segment(data = movement_frames %>% filter(frame > 1),
               aes(x = lag(quantity), y = lag(price),
                   xend = quantity, yend = price),
               color = "#E57373", linewidth = 1, alpha = 0.3,
               arrow = arrow(length = unit(0.2, "cm"))) +
  scale_x_continuous(name = "Quantity",
                     limits = c(7, 15), expand = c(0, 0)) +
  scale_y_continuous(name = "Price",
                     limits = c(0.45, 2.1), labels = dollar, expand = c(0, 0)) +
  labs(title = "Movement Along Demand Curve (Price Changes)") +
  theme_modern_econ() +
  transition_manual(frame)

anim_save("images/movement_demand.gif", p4,
          width = 700, height = 450, fps = 15, duration = 4)

cat(" ✓\n\n")

cat("✅ All animations created successfully!\n\n")
cat("Generated files:\n")
cat("  • images/demand_increase.gif (4 seconds)\n")
cat("  • images/supply_decrease.gif (4 seconds)\n")
cat("  • images/shortage_adjustment.gif (5 seconds)\n")
cat("  • images/movement_demand.gif (4 seconds)\n\n")
cat("These can be embedded in slides with:\n")
cat("  \\includegraphics[width=0.7\\textwidth]{images/demand_increase.gif}\n")
