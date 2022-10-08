reset
set multiplot
set size 0.45,0.52

#svg 800,600

set pm3d map corners2color c1
set xlabel "Fitness penalty ε"
set ylabel "log10 Mutation rate μ"

set cbrange [-1.1:2000]
set yrange [-7.9:*]
unset key

set palette defined (-1 "#FFAAAA", 0 "#FFAAAA", 0.01 "#FFFFFF", 2000 "#8888FF")

sigma = 0.02
titlestr = sprintf("σ = %.2f", sigma)
lmargin = 0.03

mylog10(x) = (x == 0 ? -8.2 : log10(x))

######### adaptation times

set ytics 1
set xrange [0:1.5]
set title "No bottleneck (σ = 0)"
set origin 0.+lmargin,0.5
splot "rev-adaptationtime-20-2-0.0000-100-0-0.txt" u ($3 == 0. ? $1 : 1/0):(mylog10($2)):4 #w pm3d notitle
set origin 0.5+lmargin,0.5
set title titlestr
splot "rev-adaptationtime-20-2-0.0000-100-0-0.txt" u ($3 == sigma ? $1 : 1/0):(mylog10($2)):4 #w pm3d notitle

######### adapted proportions

set palette defined (0 "#FF8888", 0.5 "#FFFFFF", 1 "#8888FF")
set cbrange [0:1]
set xrange [0:1.5]
set title "No bottleneck (σ = 0)"
set origin 0.+lmargin,0
splot "rev-adaptation-20-2-0.0000-100-0-0.txt" u ($3 == 0. ? $1 : 1/0):(mylog10($2)):4 #w pm3d notitle
set origin 0.5+lmargin,0
set title titlestr
splot "rev-adaptation-20-2-0.0000-100-0-0.txt" u ($3 == sigma ? $1 : 1/0):(mylog10($2)):4 #w pm3d notitle
