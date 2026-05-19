# How to Use Animations in Chapter 3

## 📊 Complete Animation Setup

You now have **three ways** to show dynamic supply and demand:

### 1. Static PDF (Primary - Always Available)
**File:** `Chapter3_SupplyDemand.pdf`
- Standard Beamer presentation with static graphs
- Works on any device, no internet needed
- Slides reference where animations are available

### 2. Animated GIFs (Secondary - For Dynamic Demonstration)
**Location:** `images/` folder
**Files:**
- `demand_increase.gif` - Demand curve smoothly shifting right
- `supply_decrease.gif` - Supply curve smoothly shifting left
- `shortage_adjustment.gif` - Price rising from shortage to equilibrium
- `movement_demand.gif` - Movement along demand curve

**How to show in class:**

**Option A: Browser (Recommended)**
```bash
# Open any GIF in browser
open images/demand_increase.gif
```
- GIFs loop automatically
- Can zoom/fullscreen
- Switch between PDF and browser tab during class

**Option B: Separate window**
- Open GIF in Preview/Photos app
- Keep window alongside presentation
- Reference when you reach relevant slide

**When to use:**
- Slide 36 (Demand Increases) → `demand_increase.gif`
- Slide 37 (Supply Decreases) → `supply_decrease.gif`
- Shortage/surplus explanation → `shortage_adjustment.gif`
- Movement vs shift → `movement_demand.gif`

### 3. Interactive Plotly Demo (For Simultaneous Shifts)
**File:** `interactive_simultaneous_shifts.html`

**Setup:**
1. **Before class:** Open `interactive_simultaneous_shifts.html` in Chrome/Firefox
2. **Keep tab open** in background
3. **When you reach Slide 33** (Simultaneous Shifts), switch to this tab

**Usage:**
Click buttons to show different scenarios:

| Scenario | Result | Interpretation |
|----------|--------|----------------|
| Large Demand ↑, Small Supply ↑ | P ↑↑, Q ↑ | Demand dominates |
| Small Demand ↑, Large Supply ↑ | P ↓, Q ↑↑ | Supply dominates |
| Equal Shifts (Both ↑) | P ?, Q ↑ | Ambiguous price |
| Demand ↑, Supply ↓ | P ↑↑↑, Q ? | Price certain to rise |
| Demand ↓, Supply ↑ | P ↓↓↓, Q ? | Price certain to fall |

**Pedagogical approach:**
1. Show first scenario - ask students to predict
2. Click button to reveal outcome
3. Discuss why this result occurred
4. Show contrasting scenario
5. Emphasize role of relative magnitudes

---

## 🎓 Recommended Workflow for Class

### Before Class:
```bash
# 1. Open interactive demo in browser
open interactive_simultaneous_shifts.html

# 2. (Optional) Open a GIF in another browser tab for quick access
open images/demand_increase.gif
```

### During Class:

**Standard slides (1-35):** Use PDF presentation normally

**Slide 36 (Demand Increases):**
1. Advance to slide (shows static diagram)
2. *"Let's see this happening in real-time..."*
3. ⌘+Tab to browser with `demand_increase.gif`
4. Let animation loop 2-3 times while explaining
5. Return to PDF

**Slide 37 (Supply Decreases):**
- Same approach with `supply_decrease.gif`

**Slide 33 (Simultaneous Shifts):**
1. Present the iPhone example from PDF
2. *"But what if the shifts have different magnitudes?"*
3. ⌘+Tab to `interactive_simultaneous_shifts.html`
4. Click through 3-4 scenarios
5. Return to PDF

---

## 💡 Pedagogical Tips

### For GIF Animations:
✅ **Let the animation loop** - Don't talk over it immediately
✅ **Pause on equilibrium** - "Notice where the equilibrium dot lands"
✅ **Contrast before/after** - Show static slide first, then animation
✅ **Student prediction** - "What do you think will happen to price?"

### For Interactive Demo:
✅ **Build suspense** - "Let's test your prediction..."
✅ **Multiple examples** - Show 3-4 scenarios minimum
✅ **Pattern recognition** - "What determines which way price goes?"
✅ **Real-world connection** - "This is why the vanilla crisis was so extreme"

### For Overlays (Knowledge Checks):
✅ **Wait for answers** - Give 10-15 seconds before advancing
✅ **Poll the room** - "Show of hands for option A?"
✅ **Discuss reasoning** - "Why did you choose that?"

---

## 🔧 Technical Setup

### First-Time Setup (Already Complete):
```bash
# Install R packages (DONE)
# Rscript -e "install.packages(c('gganimate', 'plotly', 'htmlwidgets'))"

# Generate animations (DONE)
# Rscript create_animations.R

# Generate interactive (DONE)
# Rscript interactive_simultaneous_shifts.R
```

### If You Need to Regenerate:

**Change animation speed:**
Edit `create_animations.R`:
```r
anim_save("images/demand_increase.gif", p1,
          duration = 6)  # Change from 4 to 6 seconds (slower)
```

**Add more scenarios to interactive:**
Edit `interactive_simultaneous_shifts.R`:
```r
scenarios <- list(
  # Add new scenario
  list(name = "Your scenario name",
       d_int = 3.2,  # Demand intercept
       s_int = -0.2, # Supply intercept
       result = "P ?, Q ?"),
  # ... existing scenarios
)
```

Then regenerate:
```bash
Rscript create_animations.R          # For GIFs
Rscript interactive_simultaneous_shifts.R  # For interactive
```

---

## 📱 Alternative: Screen Sharing from Browser

If you present from a laptop:

1. Open all animations in browser tabs before class
2. Share entire screen (not just window)
3. Switch between PDF and browser seamlessly
4. Works great with external monitors

**Tab organization:**
- Tab 1: `interactive_simultaneous_shifts.html`
- Tab 2: `demand_increase.gif`
- Tab 3: `supply_decrease.gif`
- Tab 4: `shortage_adjustment.gif`

---

## ❓ Troubleshooting

**GIF won't open:**
- Try different browser (Chrome usually best)
- Check file exists: `ls images/*.gif`
- Regenerate if corrupted: `Rscript create_animations.R`

**Interactive demo not loading:**
- Enable JavaScript in browser
- Try Chrome/Firefox instead of Safari
- Check console for errors (F12)

**Animations too fast/slow:**
- Edit `create_animations.R`
- Change `fps` (frames per second) or `duration`
- Regenerate: `Rscript create_animations.R`

**Want different colors:**
- Edit both R scripts
- Change `col_demand` and `col_supply` hex codes
- Must match presentation theme

---

## 🎯 Why This Three-Part Approach Works

1. **PDF (Static)** = Always available, reliable, portable
2. **GIFs (Animated)** = Show dynamics for standard cases
3. **Interactive (Plotly)** = Explore complex scenarios with student input

This gives you:
- ✅ Flexibility (use what works for your teaching style)
- ✅ Reliability (PDF always works)
- ✅ Engagement (animations capture attention)
- ✅ Depth (interactive allows exploration)

---

## 📚 Next Steps

**Want more animations?** Consider creating:
- Tax incidence shifting
- Price ceiling/floor effects
- Consumer/producer surplus areas
- Elasticity comparisons

Templates are in `create_animations.R` - just modify curves and labels!

**Want full HTML slides?** Consider converting to:
```yaml
format: revealjs  # Instead of beamer
```
This enables:
- Embedded GIFs in slides
- Interactive plotly graphs inline
- Responsive design
- But: loses PDF portability
