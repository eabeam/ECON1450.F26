# Animation and Interactivity Guide

This guide explains the animations and interactive elements in Chapter 3.

## 📁 Files Created

### Animated GIFs (in `/images/`)
1. **demand_increase.gif** - Shows demand curve shifting right, equilibrium adjusting
2. **supply_decrease.gif** - Shows supply curve shifting left, equilibrium adjusting
3. **shortage_adjustment.gif** - Price rising from shortage to equilibrium
4. **movement_demand.gif** - Movement along demand curve as price changes

### Interactive HTML
- **interactive_simultaneous_shifts.html** - Interactive plotly diagram for exploring simultaneous shifts

### Source Scripts
- **create_animations.R** - Generates all GIF animations
- **interactive_simultaneous_shifts.R** - Creates interactive plotly HTML

---

## 🎬 How to Use in Class

### 1. Animated GIFs (Embedded in PDF)

The GIFs are already embedded in the presentation PDF:

- **Slide 36**: Demand increase animation
- **Slide 37**: Supply decrease animation

**In class:**
- Advance to the slide - GIF plays automatically
- GIFs loop continuously (great for discussion)
- No internet required - embedded in PDF

### 2. Interactive Simultaneous Shifts Demo

**Location:** Slide 33 (Simultaneous Shifts)

**Setup before class:**
1. Open `interactive_simultaneous_shifts.html` in your browser
2. Keep the tab open in background
3. When you reach slide 33, switch to the browser tab

**Usage:**
- Click buttons to show different scenarios:
  - "Large Demand ↑, Small Supply ↑" → P ↑↑, Q ↑
  - "Small Demand ↑, Large Supply ↑" → P ↓, Q ↑↑
  - "Equal Shifts" → P ?, Q ↑
  - "Demand ↑, Supply ↓" → P ↑↑↑, Q ?
  - "Demand ↓, Supply ↑" → P ↓↓↓, Q ?

- Original curves (D₀, S₀) shown as dashed lines
- New curves (D₁, S₁) shown as solid lines
- Equilibrium points clearly marked with coordinates

**Pedagogical value:** Students can SEE how shift magnitudes determine outcomes

---

## 🔄 Regenerating Animations

If you need to modify animations (different colors, speeds, etc.):

### Regenerate GIFs:
```bash
Rscript create_animations.R
```

### Regenerate Interactive:
```bash
Rscript interactive_simultaneous_shifts.R
```

### Customization options:

**In `create_animations.R`:**
- `n_frames`: Number of frames (higher = smoother, slower to generate)
- `fps`: Frames per second (higher = faster animation)
- `duration`: Total animation time in seconds
- Colors: Change `col_demand`, `col_supply` to match your theme

**In `interactive_simultaneous_shifts.R`:**
- Add more scenarios to the `scenarios` list
- Adjust intercepts to show different shift magnitudes
- Modify color scheme to match presentation

---

## 💡 Tips for Effective Use

### GIF Animations:
✓ **Do:** Let them loop while explaining the concept
✓ **Do:** Pause to point out specific moments
✓ **Do:** Ask students "What do you notice?"
✗ **Don't:** Talk over the animation - let students watch first

### Interactive Demo:
✓ **Do:** Ask students to predict outcomes before revealing
✓ **Do:** Show multiple scenarios to reinforce patterns
✓ **Do:** Connect back to real-world examples
✗ **Don't:** Rush through scenarios - this is the "aha!" moment

---

## 🎯 Pedagogical Alignment

### Why GIFs work for standard shifts:
- **Visual continuity:** Students see the curve actually moving
- **Temporal dynamics:** Shows adjustment process, not just before/after
- **Attention:** Movement captures attention better than static diagrams

### Why interactive works for simultaneous shifts:
- **Complexity:** Too many scenarios for static slides
- **Exploration:** Students learn by seeing multiple examples
- **Control:** You can respond to student questions ("What if demand increases MORE?")

---

## 🔧 Technical Notes

### GIF File Sizes:
- demand_increase.gif: ~400KB
- supply_decrease.gif: ~420KB
- shortage_adjustment.gif: ~450KB
- movement_demand.gif: ~380KB

Total: ~1.6MB (minimal impact on PDF size)

### Browser Compatibility (Interactive):
- ✓ Chrome, Firefox, Safari, Edge
- ✓ Works offline (self-contained HTML)
- ✓ No special plugins required

### Troubleshooting:

**GIFs not playing in PDF:**
- Some PDF viewers don't support animated GIFs
- Adobe Acrobat Reader: ✓ Works
- Preview (Mac): ✓ Works
- Chrome PDF viewer: ✓ Works
- Older viewers: May show first frame only

**Interactive not loading:**
- Check that JavaScript is enabled
- Try a different browser
- File must be local or on a web server (security restrictions)

---

## 📚 Additional Resources

### Want more animations?

Create similar animations for:
- Market with price ceiling/floor
- Tax incidence shifting
- Consumer/producer surplus
- Elasticity comparisons

Template available in `create_animations.R` - just modify the curves and labels!

### Want different interactivity?

Consider:
- Shiny app for real-time student polling (predict outcomes, then reveal)
- RevealJS slides (HTML) for full interactivity throughout
- Embedded videos of real-world examples

---

## 📝 Attribution

Animations created using:
- **gganimate** by Thomas Lin Pedersen
- **plotly** by Plotly Technologies
- **ggplot2** by Hadley Wickham

All tools are open-source R packages.
