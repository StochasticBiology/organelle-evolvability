reset
set multiplot
set size 0.4,0.33

#svg 800,800
set pm3d map corners2color c1
set xlabel "Fitness penalty"
set ylabel "Mutation rate"

set ytics 0.01

set palette defined (0 "#FF8888", 0.01 "#FFFFFF", 1 "#8888FF")

set xrange [0:1.5]

set title "No bottleneck (σ = 0)"
set origin 0.02,0.66
splot "adaptation-20-2-0-1.txt" u ($3 == 0. ? $1 : 1/0):2:4 w pm3d notitle
set origin 0.52,0.66
set title "σ = 0.2"
splot "adaptation-20-2-0-1.txt" u ($3 == 0.2 ? $1 : 1/0):2:4 w pm3d notitle

set title "No bottleneck (σ = 0)"
set origin 0.02,0.33
splot "adaptation-20-2-0-2.txt" u ($3 == 0. ? $1 : 1/0):2:4 w pm3d notitle
set origin 0.52,0.33
set title "σ = 0.2"
splot "adaptation-20-2-0-2.txt" u ($3 == 0.2 ? $1 : 1/0):2:4 w pm3d notitle


set title "No bottleneck (σ = 0)"
set origin 0.02,0.
splot "adaptation-20-2-0-3.txt" u ($3 == 0. ? $1 : 1/0):2:4 w pm3d notitle
set origin 0.52,0.
set title "σ = 0.2"
splot "adaptation-20-2-0-3.txt" u ($3 == 0.2 ? $1 : 1/0):2:4 w pm3d notitle
