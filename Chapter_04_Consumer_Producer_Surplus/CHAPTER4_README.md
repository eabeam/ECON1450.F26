# Chapter 4: Consumer and Producer Surplus - RevealJS Presentation

## Files Created

### Main Presentation
- **Chapter4_ConsumerProducerSurplus_RevealJS.qmd** - Source file
- **Chapter4_ConsumerProducerSurplus_RevealJS.html** - Rendered presentation

### Styling
- **custom-revealjs.css** - Custom styling (copied and adapted from Chapter 3)
  - Modern Minimal theme
  - IBM Plex Sans font
  - Teal accent color (#009688)
  - Custom callout boxes, definition boxes, summary boxes

### Images Used
All images are in the `images/` subdirectory:
- `oneshirt.png`, `twoshirts.png`, `three shirts.png` - George's shirt examples
- `marketforhamburgers.png` - Hamburger market supply/demand graph
- `candlalabra.png` - Octopus candle holder image
- `gas shortage.png` - Gas shortage illustration
- Additional PowerPoint-extracted images (image1.png through image240.png)

---

## Presentation Structure

### Total Slides: ~45 slides

#### Core Concepts (Slides 1-20)
1. **Title & Learning Objectives**
2. **Consumer Surplus**
   - Definition: WTP - Price
   - Individual consumer surplus (George buying shirts at $18/$14/$10)
   - Market consumer surplus graphs (R/ggplot2)
3. **Producer Surplus**
   - Definition: Price - WTS
   - Individual producer surplus (textbook sellers)
   - Market producer surplus graphs (R/ggplot2)
4. **Total Surplus**
   - TS = CS + PS
   - Market efficiency visualization

#### Deadweight Loss (Slides 21-26)
5. **Price Controls**
   - Price ceiling effects (creates shortage + DWL)
   - Price floor effects (creates surplus + DWL)
   - Visual graphs with shaded DWL triangles

#### Knowledge Checks (Slides 27-40)
6. **George Buys Shirts** (with shirt images)
   - Part 1: Efficient quantity to purchase
   - Part 2: Consumer surplus calculation
7. **Calculator Purchase** (Mark and Rasheed)
8. **Textbook Buyback** (Aleisha, Brad, Daya, Red)
9. **Hamburger Market Questions** (multiple scenarios using hamburger graph)
10. **Uber Surge Pricing**
    - Consumer surplus scenario
    - What market problem does Uber solve?
    - Why Uber is "an economist's dream"
    - $7 billion consumer surplus estimate
11. **Octopus Candle Holders** (with candle image)
    - Part 1: Producer surplus at equilibrium
    - Part 2: Total surplus at equilibrium
    - Part 3: Effect of Amazon price ceiling

#### Market Efficiency & Failures (Slides 41-45)
12. **When Markets Work Well**
    - Three conditions for efficiency
    - Role of property rights
    - Economic signals
13. **Market Failures (Detailed)**
    - Lack of competition (monopoly)
    - Information asymmetry (lemons problem)
    - Externalities (positive and negative)
    - Public goods (non-excludable, non-rivalrous)
14. **Summary & Preview**

---

## R/ggplot2 Graphs Created

All graphs created programmatically with R code embedded in the .qmd file:

### Consumer Surplus Graphs
1. **George's Individual CS** - Bar chart showing WTP for each shirt with CS shaded
2. **Market CS** - Supply/demand with green CS area above equilibrium price

### Producer Surplus Graphs
3. **Textbook Sellers** - Bar chart showing WTS with PS shaded
4. **Market PS** - Supply/demand with yellow PS area below equilibrium price

### Total Surplus
5. **Combined CS + PS** - Both areas shaded on same graph

### Deadweight Loss
6. **Price Ceiling** - Shows new CS, new PS, transferred surplus, and red DWL triangle
7. **Price Floor** - Shows new CS, new PS, transferred surplus, and red DWL triangle

### Knowledge Check Graphs
8. **Hamburger Market** - Basic S/D graph for multiple questions
   - Used for CS calculations
   - Used for equilibrium vs. disequilibrium questions

---

## Key Features

### Visual Design
- **Modern Minimal theme** matching Chapter 3
- **IBM Plex Sans font** for professional appearance
- **Teal accent color** (#009688) for consistency
- **Responsive layout** (1600x900) optimized for projection

### Interactive Elements
- **Fragment reveals** for answers to knowledge check questions
- **Incremental lists** for step-by-step explanations
- **Callout boxes** for important concepts and tips
- **Definition boxes** for key terms

### Real-World Applications
- **Uber surge pricing** - Dynamic pricing and market equilibrium
- **Textbook buyback** - Producer surplus in action
- **Octopus candle holders** - Unusual market example
- **George's shirts** - Relatable consumer decision-making

### Color Coding (Consistent with Economics Standards)
- **Blue** - Demand curves, consumer surplus
- **Orange/Yellow** - Supply curves, producer surplus
- **Red** - Deadweight loss, price controls
- **Green** - Consumer surplus areas
- **Teal** - Accent color, emphasis

---

## How to Use

### Viewing the Presentation
1. Open `Chapter4_ConsumerProducerSurplus_RevealJS.html` in any modern web browser
2. Use arrow keys (→ ←) to navigate between slides
3. Press `F` for fullscreen
4. Press `S` for speaker notes view
5. Press `?` for keyboard shortcuts

### Editing the Presentation
1. Edit `Chapter4_ConsumerProducerSurplus_RevealJS.qmd`
2. Modify R code chunks to adjust graphs
3. Update custom-revealjs.css for styling changes
4. Render with: `quarto render Chapter4_ConsumerProducerSurplus_RevealJS.qmd`

### Adding Content
- **New slides**: Add `---` separator
- **New graphs**: Create R code chunk with ggplot2
- **Images**: Place in `images/` folder and reference with `![](images/filename.png)`
- **Fragments**: Wrap content with `::: {.fragment}` and `:::`
- **Columns**: Use `::: {.columns}` and `::: {.column width="50%"}`

---

## Technical Notes

### R Packages Required
- `ggplot2` - All graphs
- `tibble` - Data frames for examples

### Quarto Requirements
- Quarto 1.3+ with RevealJS support
- R installation with required packages
- Custom CSS must have SCSS layer markers (`/*-- scss:defaults --*/`)

### Graph Specifications
- All graphs use **600 DPI** for high-quality projection
- Consistent color palette across all visualizations
- Large text sizes (16-20pt) for readability
- Axes labeled with dollar signs where appropriate

---

## Content Alignment with Learning Objectives

### Students Will Be Able To:
✓ **Calculate consumer surplus** from willingness to pay
  - Individual and market levels
  - Multiple worked examples (George, calculators, Uber)

✓ **Calculate producer surplus** from willingness to sell
  - Individual and market levels
  - Textbook buyback, hamburger market examples

✓ **Define and identify deadweight loss**
  - Price ceiling and floor visualizations
  - Octopus candle holder price cap example

✓ **Understand when markets lead to efficiency**
  - Three conditions clearly stated
  - Property rights and economic signals explained

✓ **Identify types of market failures**
  - All four types covered in detail with examples
  - Real-world applications provided

---

## Comparison to PowerPoint Version

### Improvements Over Original
1. **All graphs recreated in R** - No pixelated images, fully scalable
2. **Interactive reveals** - Answers appear on click, not separate slides
3. **Consistent modern styling** - Matches Chapter 3 aesthetic
4. **Embedded real-world examples** - Uber, market failures integrated smoothly
5. **Better navigation** - Linear flow, no vertical nesting issues

### Content Preserved
- All knowledge check questions included
- All key concepts and definitions
- Real-world examples (Uber, textbooks, shirts, candles)
- Learning objectives maintained
- Market failure categories complete

---

## Future Enhancements (Optional)

### Potential Additions
1. **Interactive surplus calculator** - Plotly widget for live CS/PS calculation
2. **Animated shifts** - GIF showing price changes and DWL emerging
3. **Video embed** - "Why Uber is an Economist's Dream" Freakonomics podcast
4. **Additional examples** - Concert tickets, housing markets, minimum wage

### Customization Options
- Adjust color scheme in custom-revealjs.css
- Modify graph aesthetics in R code chunks
- Add institution logo to title slide
- Include instructor contact information

---

## File Locations

```
Chapter_04_Consumer_Producer_Surplus/
├── Chapter4_ConsumerProducerSurplus_RevealJS.qmd
├── Chapter4_ConsumerProducerSurplus_RevealJS.html
├── custom-revealjs.css
├── CHAPTER4_README.md (this file)
├── images/
│   ├── oneshirt.png
│   ├── twoshirts.png
│   ├── three shirts.png
│   ├── marketforhamburgers.png
│   ├── candlalabra.png
│   ├── gas shortage.png
│   └── [additional PowerPoint images]
└── [source PowerPoint and PDF files]
```

---

## Questions or Issues?

For any questions about the presentation structure, content, or how to modify it, refer to the `REVEALJS_EDITING_GUIDE.md` in the Chapter 3 directory (same editing principles apply).
