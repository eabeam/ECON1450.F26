# Chapter 3: Supply and Demand

## Theme Sampler

Five custom Beamer themes have been designed for this course. Each sampler demonstrates the same content in a different visual style.

### Available Themes

1. **Classic Academic** (`sampler_1_classic.qmd`)
   - Traditional navy blue and burgundy
   - Serif fonts
   - Formal presentation style
   - Best for: academic conferences, formal settings

2. **Modern Minimal** (`sampler_2_modern.qmd`)
   - Clean teal accent on white
   - Sans-serif throughout
   - Lots of white space
   - Best for: contemporary presentations, industry talks

3. **Bold Visual** (`sampler_3_bold.qmd`)
   - Striking coral and teal colors
   - Geometric design elements
   - Eye-catching, high energy
   - Best for: large lecture halls, student engagement

4. **Elegant Professional** (`sampler_4_elegant.qmd`)
   - Sophisticated slate blue, warm gray, gold accents
   - Mixed serif/sans-serif
   - Refined business aesthetic
   - Best for: professional/executive presentations

5. **Data-First** (`sampler_5_data.qmd`)
   - Neutral grays with data blue accent
   - Optimized for graph readability
   - Minimal decoration
   - Best for: data-heavy, technical presentations

### How to Compile

#### Individual Sampler
```bash
quarto render sampler_1_classic.qmd
```

#### All Samplers at Once
```bash
# From the Chapter_03_Supply_Demand directory
for file in sampler_*.qmd; do
    quarto render "$file"
done
```

Or use the provided script:
```bash
bash compile_samplers.sh
```

### Requirements

- R (≥4.0) with packages: `ggplot2`, `dplyr`, `scales`
- Quarto (≥1.3)
- LaTeX distribution (TinyTeX recommended)

### Output

PDFs will be generated in the same directory with matching names:
- `sampler_1_classic.pdf`
- `sampler_2_modern.pdf`
- `sampler_3_bold.pdf`
- `sampler_4_elegant.pdf`
- `sampler_5_data.pdf`

### Customization

Theme files are located in `../_themes/` and can be edited:
- `beamerthemeClassicAcademic.sty`
- `beamerthemeModernMinimal.sty`
- `beamerthemeBoldVisual.sty`
- `beamerthemeElegantProfessional.sty`
- `beamerthemeDataFirst.sty`

### Next Steps

After reviewing the samplers:
1. Choose your preferred theme (or mix elements)
2. The full Chapter 3 deck will be built using your selected design
3. All visualizations will be generated with R for consistency
