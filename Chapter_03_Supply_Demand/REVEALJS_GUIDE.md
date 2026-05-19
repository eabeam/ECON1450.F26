# RevealJS Presentation Guide

## Files Created

### 1. **Chapter3_SupplyDemand_RevealJS.html** (Classroom Presentation)
   - Full-screen HTML presentation with embedded GIF animations
   - Modern Minimal theme matching your Beamer PDF
   - IBM Plex Sans font
   - All 4 animated GIFs embedded directly in slides

### 2. **Chapter3_SupplyDemand.pdf** (Student Distribution)
   - Static PDF version for printing and annotation
   - Same content, static figures instead of GIFs

### 3. **custom-revealjs.css** (Styling)
   - Custom CSS matching your Modern Minimal theme
   - Teal accent color (#009688)
   - Clean, professional design

---

## How to Use in Class

### Opening the Presentation

1. **Double-click** `Chapter3_SupplyDemand_RevealJS.html`
   - Opens in your default browser

2. **Press `F` key** to enter full-screen presentation mode
   - Now you're presenting, just like PowerPoint

### Navigating Slides

| Key | Action |
|-----|--------|
| **→** or **Space** | Next slide |
| **←** | Previous slide |
| **↓** | Next vertical slide (if any) |
| **↑** | Previous vertical slide |
| **Esc** | Overview mode (see all slides) |
| **F** | Toggle full-screen |
| **S** | Speaker notes (if added) |
| **?** | Show keyboard shortcuts |

### Features

- **GIFs auto-play** when you reach the slide
- **Knowledge checks** reveal answers incrementally (press → again)
- **Slide numbers** appear in bottom-right corner
- **No window switching** - everything in one presentation

---

## Making Updates

If you need to modify content:

1. **Edit:** `Chapter3_SupplyDemand_RevealJS.qmd`
2. **Render:**
   ```bash
   quarto render Chapter3_SupplyDemand_RevealJS.qmd
   ```
3. **Refresh browser** to see changes

---

## Embedded GIFs

The following animations are embedded:

1. **Slide 36:** Demand increase (demand_increase.gif)
2. **Slide 37:** Supply decrease (supply_decrease.gif)

Additional GIFs available (not yet embedded):
- movement_demand.gif
- shortage_adjustment.gif

Let me know if you want these added to specific slides!

---

## Browser Recommendations

Works best in:
- **Chrome** (recommended)
- **Firefox**
- **Safari**
- **Edge**

All modern browsers support full-screen presentation mode.

---

## Sharing with Students

**For class:** Use the HTML version (Chapter3_SupplyDemand_RevealJS.html)

**For distribution:** Use the PDF version (Chapter3_SupplyDemand.pdf)
- Students can print, annotate, and view offline
- Smaller file size for Canvas/email
- Works on any device

---

## Next Steps

If you'd like to:
- Add more GIFs to other slides
- Customize colors or fonts
- Add speaker notes
- Enable additional features

Just let me know!
