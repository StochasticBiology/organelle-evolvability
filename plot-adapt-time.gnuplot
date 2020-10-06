reset
set multiplot
set size 0.45,0.52

#svg 800,600

set pm3d map corners2color c1
set xlabel "Fitness penalty ε"
set ylabel "Mutation rate μ"

set cbrange [-1:2000]

set palette defined (-1 "#FFAAAA", 0 "#FFAAAA", 0.01 "#FFFFFF", 2000 "#8888FF")

set ytics 0.01
set xrange [0:1.5]
set title "No bottleneck (σ = 0)"
set origin 0.02,0.5
splot "adaptationtime-20-2-0-0.txt" u ($3 == 0. ? $1 : 1/0):2:4 w pm3d notitle
set origin 0.5,0.5
set title "σ = 0.2"
splot "adaptationtime-20-2-0-0.txt" u ($3 == 0.2 ? $1 : 1/0):2:4 w pm3d notitle

#########

set palette defined (0 "#FF8888", 0.01 "#FFFFFF", 1 "#8888FF")
set cbrange [0:1]
set xrange [0:1.5]
set title "No bottleneck (σ = 0)"
set origin 0.02,0
splot "adaptation-20-2-0-0.txt" u ($3 == 0. ? $1 : 1/0):2:4 w pm3d notitle
set origin 0.5,0
set title "σ = 0.2"
splot "adaptation-20-2-0-0.txt" u ($3 == 0.2 ? $1 : 1/0):2:4 w pm3d notitle
