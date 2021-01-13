reset
set multiplot
set size 0.3,1

#svg 800,600

set pm3d map corners2color c1
set xlabel "Fitness penalty ε"
set ylabel "Mutation rate μ"

set cbrange [-1:2000]

sigma = 0.02
lmargin = 0.035

#########

#set palette defined (0 "#FF8888", 0.01 "#FFFFFF", 1 "#8888FF")
set palette defined (0 "#FF8888", 0.5 "#FFFFFF", 1 "#8888FF")
set cbrange [0:1]
set xrange [0:1.5]

set origin 0.+lmargin,0
set title "n = 100"
splot "adaptation-20-2-0.0000-100-2-0.txt" u ($3 == sigma ? $1 : 1/0):2:4 w pm3d notitle

set origin 0.33+lmargin,0
set title "n = 10"
splot "adaptation-20-2-0.0000-10-2-0.txt" u ($3 == sigma ? $1 : 1/0):2:4 w pm3d notitle

set origin 0.66+lmargin,0
set title "n = 1000"
splot "adaptation-20-2-0.0000-1000-2-0.txt" u ($3 == sigma ? $1 : 1/0):2:4 w pm3d notitle
