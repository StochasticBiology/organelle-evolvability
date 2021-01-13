reset
set multiplot
set size 0.2,0.33

#svg 800,600

set pm3d map corners2color c1
set xlabel "Fitness penalty ε"
set ylabel "Mutation rate μ"

set cbrange [0:1]

set palette defined (0 "#FFAAAA", 0.5 "#FFFFFF", 1 "#8888FF")

set xtics 0.4
set ytics 0.01
set xrange [0:1.5]

set title "N = 20, Noff = 2, σ = 0"
set origin 0.02,0.
splot "adaptation-20-2-0.0000-100-2-0.txt" u ($3 == 0. ? $1 : 1/0):2:4 w pm3d notitle
set origin 0.27,0.
set title "σ = 0.02"
splot "adaptation-20-2-0.0000-100-2-0.txt" u ($3 == 0.02 ? $1 : 1/0):2:4 w pm3d notitle

set title "N = 20, Noff = 5, σ = 0"
set origin 0.52,0.
splot "adaptation-20-5-0.0000-100-2-0.txt" u ($3 == 0. ? $1 : 1/0):2:4 w pm3d notitle
set origin 0.77,0.
set title "σ = 0.02"
splot "adaptation-20-5-0.0000-100-2-0.txt" u ($3 == 0.02 ? $1 : 1/0):2:4 w pm3d notitle

###

set title "N = 50, Noff = 2, σ = 0"
set origin 0.02,0.33
splot "adaptation-50-2-0.0000-100-2-0.txt" u ($3 == 0. ? $1 : 1/0):2:4 w pm3d notitle
set origin 0.27,0.33
set title "σ = 0.02"
splot "adaptation-50-2-0.0000-100-2-0.txt" u ($3 == 0.02 ? $1 : 1/0):2:4 w pm3d notitle

set title "N = 50, Noff = 5, σ = 0"
set origin 0.52,0.33
splot "adaptation-50-5-0.0000-100-2-0.txt" u ($3 == 0. ? $1 : 1/0):2:4 w pm3d notitle
set origin 0.77,0.33
set title "σ = 0.02"
splot "adaptation-50-5-0.0000-100-2-0.txt" u ($3 == 0.02 ? $1 : 1/0):2:4 w pm3d notitle

###

set title "N = 100, Noff = 2, σ = 0"
set origin 0.02,0.66
splot "adaptation-100-2-0.0000-100-2-0.txt" u ($3 == 0. ? $1 : 1/0):2:4 w pm3d notitle
set origin 0.27,0.66
set title "σ = 0.02"
splot "adaptation-100-2-0.0000-100-2-0.txt" u ($3 == 0.02 ? $1 : 1/0):2:4 w pm3d notitle

set title "N = 100, Noff = 5, σ = 0"
set origin 0.52,0.66
splot "adaptation-100-5-0.0000-100-2-0.txt" u ($3 == 0. ? $1 : 1/0):2:4 w pm3d notitle
set origin 0.77,0.66
set title "σ = 0.02"
splot "adaptation-100-5-0.0000-100-2-0.txt" u ($3 == 0.02 ? $1 : 1/0):2:4 w pm3d notitle
 
