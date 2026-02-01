#!/bin/bash
# Compile all theme samplers

# So LaTeX/Beamer can find custom themes in ../_themes/
export TEXINPUTS=".:$(cd "$(dirname "$0")" && pwd)/../_themes//:${TEXINPUTS:-}"

echo "Compiling theme samplers for ECON 1450 Chapter 3..."
echo ""

samplers=(
    "sampler_1_classic.qmd"
    "sampler_2_modern.qmd"
    "sampler_3_bold.qmd"
    "sampler_4_elegant.qmd"
    "sampler_5_data.qmd"
)

for sampler in "${samplers[@]}"; do
    echo "Rendering $sampler..."
    quarto render "$sampler"
    if [ $? -eq 0 ]; then
        echo "✓ $sampler compiled successfully"
    else
        echo "✗ Error compiling $sampler"
        exit 1
    fi
    echo ""
done

echo "All samplers compiled successfully!"
echo ""
echo "Generated PDFs:"
ls -1 sampler_*.pdf 2>/dev/null
