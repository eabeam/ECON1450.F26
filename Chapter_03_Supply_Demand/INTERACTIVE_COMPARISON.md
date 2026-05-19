# Interactive Demo Comparison

## Two Versions Available

### Version 1: `interactive_simultaneous_shifts.html` (Original)
**Design:** Pre-set scenarios with dropdown buttons

**How it works:**
- Click a button to see a specific scenario
- 5 pre-programmed combinations:
  - Large Demand ↑, Small Supply ↑
  - Small Demand ↑, Large Supply ↑
  - Equal Shifts
  - Demand ↑, Supply ↓
  - Demand ↓, Supply ↑

**Pros:**
- Shows key examples clearly
- No learning curve
- Good for quick demonstration

**Cons:**
- Limited to 5 scenarios
- Passive viewing (click and see)
- Doesn't show marginal effects
- Can't explore "what if I shift demand MORE?"

---

### Version 2: `interactive_simultaneous_shifts_v2.html` (NEW - Recommended)
**Design:** Interactive sliders with live effect decomposition

**How it works:**
1. **Start:** Single supply and demand curves with equilibrium E₀
2. **Adjust sliders:**
   - Supply: Shift left (↓) or right (↑) by increments (-3 to +3)
   - Demand: Shift left (↓) or right (↑) by increments (-3 to +3)
3. **Watch:**
   - Graph updates in real-time
   - E₁ (new equilibrium) appears with coordinates
   - Original curves shown as dashed
   - New curves shown as solid

4. **Effects Panel shows:**
   ```
   Demand shift:  ↑  →  P↑, Q↑
   Supply shift:  ↓  →  P↑, Q↓
   ─────────────────────────────
   TOTAL:         P ↑↑, Q ?
   ```

**Pros:**
- ✅ **Unlimited combinations** - students can test ANY scenario
- ✅ **Incremental learning** - see effects accumulate step-by-step
- ✅ **Effect decomposition** - shows HOW demand and supply contribute
- ✅ **Magnitude indicators** (↑ vs ↑↑) - shows relative size of effects
- ✅ **Active exploration** - students discover patterns themselves
- ✅ **Shows "?" for ambiguous** - makes uncertainty explicit

**Why this is better pedagogically:**

1. **Constructivist learning:** Students build understanding by exploring
2. **Marginal thinking:** Can add "one more" shift and see what changes
3. **Pattern recognition:** After testing 5-10 combinations, students internalize the rules
4. **Addresses misconceptions:** Can test "Does big demand always beat supply?" (Answer: No!)

---

## Recommended Usage in Class

### Version 2 (Primary):

**Slide 33 (Simultaneous Shifts):**

**Setup:**
1. Open `interactive_simultaneous_shifts_v2.html` before class
2. Start with both sliders at 0 (default)

**In-class workflow:**

**Step 1: Predict (1 minute)**
```
YOU: "What happens if demand increases by 2 and supply increases by 1?"
[Give students 15 seconds to think]
YOU: "Raise your hand if you think price rises"
[Count hands]
YOU: "Raise your hand if you think price falls"
[Count hands]
```

**Step 2: Test (30 seconds)**
```
YOU: "Let's find out..."
[Move Demand slider to +2]
[Move Supply slider to +1]
YOU: "Look at the effects panel - what do we see?"
```

**Step 3: Analyze (1 minute)**
```
Point to effects panel:
- "Demand pushes P up and Q up"
- "Supply pushes P down and Q up"
- "Both push Q up → Q definitely rises (↑↑)"
- "They conflict on P → but demand's bigger, so P rises (↑)"
```

**Step 4: Test edge cases (2-3 minutes)**
```
YOU: "What if we flip it? Supply +2, Demand +1?"
[Adjust sliders]
YOU: "Now what?"
[Students see P falls!]

YOU: "Equal shifts - both +2?"
[Adjust sliders]
YOU: "See the total effect? Q ↑↑ (certain), but P shows a small change or '?'"
```

**Step 5: Challenge (if time permits)**
```
YOU: "Can someone find a combination where Q is ambiguous?"
[Student calls out: "Demand up 2, supply down 2!"]
[You adjust sliders]
YOU: "Look - P definitely rises (↑↑↑), but Q could go either way!"
```

**Total time:** 5-7 minutes (worth it!)

---

### Version 1 (Backup):

Use if:
- Short on time (just need to show 2-3 examples quickly)
- Technology fails (simpler interface, less can go wrong)
- Students need scaffolding before free exploration

---

## Technical Comparison

| Feature | Version 1 | Version 2 |
|---------|-----------|-----------|
| File size | 3.7 MB | 15 KB |
| Internet required | No | No |
| Browser compatibility | All modern | All modern |
| Mobile-friendly | Yes | Yes |
| Scenarios | 5 fixed | Infinite |
| Effect breakdown | No | Yes ✓ |
| Magnitude indicators | No | Yes ✓ |
| Coordinates shown | Yes | Yes |
| Learning curve | None | Minimal |

---

## Student Learning Outcomes

**Version 1:** Students see that outcomes depend on magnitudes
**Version 2:** Students **discover** how magnitudes determine outcomes

**Bloom's Taxonomy:**
- Version 1: Understanding level (passive viewing)
- Version 2: Analysis/Synthesis level (active exploration)

**Retention:**
- Version 1: Moderate (saw examples)
- Version 2: High (manipulated themselves)

---

## Recommendation

**Use Version 2 as primary tool.** It's more engaging, pedagogically powerful, and lets students explore freely.

Keep Version 1 as backup if technology issues arise.

Both files are in the `Chapter_03_Supply_Demand/` directory.
