reset
set multiplot
set size 0.4,0.33

#svg 800,800
set pm3d map corners2color c1
set xlabel "Fitness penalty"
set ylabel "log10 Mutation rate"

set ytics 1

lmargin = 0.07

set palette defined (0 "#FF8888", 0.5 "#FFFFFF", 1 "#8888FF")

set xrange [0:1.5]
set cbrange [0:1]

sigma = 0.01
titlestr = sprintf("σ = %.2f", sigma);

set title "No bottleneck (σ = 0)"
set origin 0+lmargin,0.66
splot "rev-adaptation-20-2-0.0000-100-0-1.txt" u ($3 == 0. ? $1 : 1/0):(log10($2)):4 w pm3d notitle
set origin 0.5+lmargin,0.66
set title titlestr
splot "rev-adaptation-20-2-0.0000-100-0-1.txt" u ($3 == sigma ? $1 : 1/0):(log10($2)):4 w pm3d notitle

set title "No bottleneck (σ = 0)"
set origin 0+lmargin,0.33
splot "rev-adaptation-20-2-0.0000-100-0-2.txt" u ($3 == 0. ? $1 : 1/0):(log10($2)):4 w pm3d notitle
set origin 0.5+lmargin,0.33
set title titlestr
splot "rev-adaptation-20-2-0.0000-100-0-2.txt" u ($3 == sigma ? $1 : 1/0):(log10($2)):4 w pm3d notitle


set title "No bottleneck (σ = 0)"
set origin 0+lmargin,0.
splot "rev-adaptation-20-2-0.0000-100-0-3.txt" u ($3 == 0. ? $1 : 1/0):(log10($2)):4 w pm3d notitle
set origin 0.5+lmargin,0.
set title titlestr
splot "rev-adaptation-20-2-0.0000-100-0-3.txt" u ($3 == sigma ? $1 : 1/0):(log10($2)):4 w pm3d notitle
