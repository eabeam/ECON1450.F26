#!/usr/bin/env Rscript
# Create placeholder images for presentation

library(ggplot2)

# Create images directory if it doesn't exist
dir.create("images", showWarnings = FALSE)

# 1. Eclipse hotel placeholder
png("images/eclipse_hotel.jpg", width = 800, height = 600, units = "px")
ggplot() +
  annotate("rect", xmin = 0, xmax = 1, ymin = 0, ymax = 1, fill = "#1a1a2e") +
  annotate("text", x = 0.5, y = 0.6, label = "BURLINGTON",
           color = "#eee", size = 18, fontface = "bold") +
  annotate("text", x = 0.5, y = 0.5, label = "April 8, 2024",
           color = "#f39c12", size = 14) +
  annotate("text", x = 0.5, y = 0.4, label = "Total Solar Eclipse",
           color = "#eee", size = 10) +
  annotate("text", x = 0.5, y = 0.15, label = "Hotel prices surge 300-700%\nas visitors flood the city",
           color = "#bbb", size = 7) +
  theme_void() +
  theme(plot.background = element_rect(fill = "#1a1a2e", color = NA))
dev.off()

# 2. Smartphone substitutes placeholder
png("images/smartphone_substitutes.jpg", width = 600, height = 800, units = "px")
ggplot() +
  annotate("rect", xmin = 0, xmax = 1, ymin = 0.5, ymax = 1, fill = "#f0f0f0") +
  annotate("rect", xmin = 0, xmax = 1, ymin = 0, ymax = 0.5, fill = "#34a853") +
  annotate("text", x = 0.5, y = 0.75, label = "iPhone",
           color = "#000", size = 16, fontface = "bold") +
  annotate("text", x = 0.5, y = 0.65, label = "Premium smartphone",
           color = "#666", size = 8) +
  annotate("text", x = 0.5, y = 0.25, label = "Android",
           color = "#fff", size = 16, fontface = "bold") +
  annotate("text", x = 0.5, y = 0.15, label = "Alternative smartphone",
           color = "#ddd", size = 8) +
  annotate("text", x = 0.5, y = 0.52, label = "SUBSTITUTES",
           color = "#009688", size = 12, fontface = "bold") +
  theme_void() +
  theme(plot.background = element_rect(fill = "white", color = NA))
dev.off()

# 3. Factory production placeholder
png("images/factory_production.jpg", width = 600, height = 800, units = "px")
ggplot() +
  annotate("rect", xmin = 0, xmax = 1, ymin = 0, ymax = 1, fill = "#2c3e50") +
  annotate("segment", x = 0.2, y = 0.7, xend = 0.8, yend = 0.7,
           color = "#f39c12", size = 4) +
  annotate("segment", x = 0.2, y = 0.5, xend = 0.8, yend = 0.5,
           color = "#95a5a6", size = 3) +
  annotate("segment", x = 0.2, y = 0.3, xend = 0.8, yend = 0.3,
           color = "#3498db", size = 3) +
  annotate("text", x = 0.5, y = 0.9, label = "PRODUCTION",
           color = "#ecf0f1", size = 14, fontface = "bold") +
  annotate("text", x = 0.5, y = 0.15, label = "Input costs affect\nsupply decisions",
           color = "#bdc3c7", size = 7) +
  theme_void() +
  theme(plot.background = element_rect(fill = "#2c3e50", color = NA))
dev.off()

# 4. Vanilla beans placeholder
png("images/vanilla_beans.jpg", width = 600, height = 800, units = "px")
ggplot() +
  annotate("rect", xmin = 0, xmax = 1, ymin = 0, ymax = 1, fill = "#3e2723") +
  annotate("rect", xmin = 0.3, xmax = 0.35, ymin = 0.3, ymax = 0.7,
           fill = "#4e342e", color = "#6d4c41") +
  annotate("rect", xmin = 0.4, xmax = 0.45, ymin = 0.35, ymax = 0.65,
           fill = "#4e342e", color = "#6d4c41") +
  annotate("rect", xmin = 0.5, xmax = 0.55, ymin = 0.25, ymax = 0.75,
           fill = "#4e342e", color = "#6d4c41") +
  annotate("rect", xmin = 0.6, xmax = 0.65, ymin = 0.3, ymax = 0.7,
           fill = "#4e342e", color = "#6d4c41") +
  annotate("text", x = 0.5, y = 0.9, label = "Madagascar",
           color = "#d7ccc8", size = 12, fontface = "bold") +
  annotate("text", x = 0.5, y = 0.82, label = "Vanilla Beans",
           color = "#bcaaa4", size = 10) +
  annotate("text", x = 0.5, y = 0.12, label = "$20/kg → $500/kg",
           color = "#ffab91", size = 8, fontface = "bold") +
  theme_void() +
  theme(plot.background = element_rect(fill = "#3e2723", color = NA))
dev.off()

cat("✓ Placeholder images created successfully\n")
