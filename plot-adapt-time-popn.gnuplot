reset
set multiplot
set size 0.45,0.52

#svg 800,600

set pm3d map corners2color c1
set xlabel "Fitness penalty ε"
set ylabel "Mutation rate μ"

set cbrange [-1:2000]
set yrange [0:0.01]

set palette defined (-1 "#FFAAAA", 0 "#FFAAAA", 0.01 "#FFFFFF", 2000 "#8888FF")

sigma = 0.02
titlestr = sprintf("σ = %.2f", sigma)

######### adaptation times

set ytics 0.002
set xrange [0:1.5]
set title "No bottleneck (σ = 0)"
set origin 0.02,0.5
splot "adaptationtime-20-2-0.0000-100-0-0.txt" u ($3 == 0. ? $1 : 1/0):2:4 w pm3d notitle
set origin 0.5,0.5
set title titlestr
splot "adaptationtime-20-2-0.0000-100-0-0.txt" u ($3 == sigma ? $1 : 1/0):2:4 w pm3d notitle

######### adapted proportions

set palette defined (0 "#FF8888", 0.5 "#FFFFFF", 1 "#8888FF")
set cbrange [0:1]
set xrange [0:1.5]
set title "No bottleneck (σ = 0)"
set origin 0.02,0
splot "adaptation-20-2-0.0000-100-0-0.txt" u ($3 == 0. ? $1 : 1/0):2:4 w pm3d notitle
set origin 0.5,0
set title titlestr
splot "adaptation-20-2-0.0000-100-0-0.txt" u ($3 == sigma ? $1 : 1/0):2:4 w pm3d notitle
