reset
set multiplot
set size 0.2,0.5

#svg 1024,480

set pm3d map corners2color c1
set xlabel "Fitness penalty ε"
set ylabel "Mutation rate μ"

set cbrange [-1:2000]
set yrange [0:0.01]
set xtics 0.4

sigma = 0.02
titlestr = sprintf("σ = %.2f", sigma)
lmargin = 0.03

######### adaptation proportion plots

set object 1 rectangle from graph 0,0 to graph 1,1 behind fillcolor rgbcolor "#000000" fillstyle solid noborder

set palette defined (0 "#FF8888", 0.5 "#FFFFFF", 1 "#8888FF")
set cbrange [0:1]
set xrange [0:1.5]

set origin 0.0+lmargin,0.5
set title "α = 0"
splot "adaptation-20-2-0.0000-100-2-0.txt" u ($3 == sigma ? $1 : 1/0):2:4 w pm3d notitle

set origin 0.25+lmargin,0.5
set title "α = 0.1"
splot "adaptation-20-2-0.1000-100-2-0.txt" u ($3 == sigma ? $1 : 1/0):2:4 w pm3d notitle

set origin 0.5+lmargin,0.5
set title "α = 2"
splot "adaptation-20-2-2.0000-100-2-0.txt" u ($3 == sigma ? $1 : 1/0):2:4 w pm3d notitle

set origin 0.75+lmargin,0.5
set title "α = 10"
splot "adaptation-20-2-10.0000-100-2-0.txt" u ($3 == sigma ? $1 : 1/0):2:4 w pm3d notitle

########## dysfunctional proportion plots

unset object 1
unset title

set palette defined (0 "#FFFFFF", 1 "#FF0000")

set origin 0.0+lmargin,0.
splot "adaptation-20-2-0.0000-100-2-0.txt" u ($3 == sigma ? $1 : 1/0):2:5 w pm3d notitle

set origin 0.25+lmargin,0.
splot "adaptation-20-2-0.1000-100-2-0.txt" u ($3 == sigma ? $1 : 1/0):2:5 w pm3d notitle

set origin 0.5+lmargin,0.
splot "adaptation-20-2-2.0000-100-2-0.txt" u ($3 == sigma ? $1 : 1/0):2:5 w pm3d notitle

set origin 0.75+lmargin,0.
splot "adaptation-20-2-10.0000-100-2-0.txt" u ($3 == sigma ? $1 : 1/0):2:5 w pm3d notitle
