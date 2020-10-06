reset
set multiplot
set size 0.2,0.33

#svg 800,600

set pm3d map corners2color c1
set xlabel "Fitness penalty ε"
set ylabel "Mutation rate μ"

set cbrange [-1:2000]

set palette defined (-1 "#FFAAAA", 0 "#FFAAAA", 0.01 "#FFFFFF", 2000 "#8888FF")

set ytics 0.01
set xrange [0:1.5]

set title "N = 20, Noff = 2, σ = 0"
set origin 0.02,0.
splot "adaptationtime-20-2-0-0.txt" u ($3 == 0. ? $1 : 1/0):2:4 w pm3d notitle
set origin 0.27,0.
set title "σ = 0.1"
splot "adaptationtime-20-2-0-0.txt" u ($3 == 0.1 ? $1 : 1/0):2:4 w pm3d notitle

set title "N = 20, Noff = 5, σ = 0"
set origin 0.52,0.
splot "adaptationtime-20-5-0-0.txt" u ($3 == 0. ? $1 : 1/0):2:4 w pm3d notitle
set origin 0.77,0.
set title "σ = 0.1"
splot "adaptationtime-20-5-0-0.txt" u ($3 == 0.1 ? $1 : 1/0):2:4 w pm3d notitle

###

set title "N = 50, Noff = 2, σ = 0"
set origin 0.02,0.33
splot "adaptationtime-50-2-0-0.txt" u ($3 == 0. ? $1 : 1/0):2:4 w pm3d notitle
set origin 0.27,0.33
set title "σ = 0.1"
splot "adaptationtime-50-2-0-0.txt" u ($3 == 0.1 ? $1 : 1/0):2:4 w pm3d notitle

set title "N = 50, Noff = 5, σ = 0"
set origin 0.52,0.33
splot "adaptationtime-50-5-0-0.txt" u ($3 == 0. ? $1 : 1/0):2:4 w pm3d notitle
set origin 0.77,0.33
set title "σ = 0.1"
splot "adaptationtime-50-5-0-0.txt" u ($3 == 0.1 ? $1 : 1/0):2:4 w pm3d notitle

###

set title "N = 100, Noff = 2, σ = 0"
set origin 0.02,0.66
splot "adaptationtime-100-2-0-0.txt" u ($3 == 0. ? $1 : 1/0):2:4 w pm3d notitle
set origin 0.27,0.66
set title "σ = 0.1"
splot "adaptationtime-100-2-0-0.txt" u ($3 == 0.1 ? $1 : 1/0):2:4 w pm3d notitle

set title "N = 100, Noff = 5, σ = 0"
set origin 0.52,0.66
splot "adaptationtime-100-5-0-0.txt" u ($3 == 0. ? $1 : 1/0):2:4 w pm3d notitle
set origin 0.77,0.66
set title "σ = 0.1"
splot "adaptationtime-100-5-0-0.txt" u ($3 == 0.1 ? $1 : 1/0):2:4 w pm3d notitle
 
