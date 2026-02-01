# ECON 1450: Principles of Microeconomics

Fall 2026 Course Materials

## Repository Structure

- `_themes/` - Custom Beamer presentation themes
- `Chapter_03_Supply_Demand/` - Chapter 3: Supply and Demand
  - `figures/` - R-generated visualizations
  - `data/` - Data files for examples
- `assets/` - Shared images and resources

## Building Presentations

Presentations are written in Quarto (`.qmd` files) and render to Beamer PDF.

Requirements:
- R (≥4.0)
- Quarto (≥1.3)
- LaTeX distribution (TinyTeX or full TeX Live)

To render a presentation:
```bash
quarto render Chapter_03_Supply_Demand/Chapter3.qmd
```

## License

Course materials © 2026. For educational use.
