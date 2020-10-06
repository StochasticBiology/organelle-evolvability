reset
set multiplot
set pm3d map corners2color c1

#svg 800,300

set size 0.28,1
unset key

set cbrange [0:0.3]
set cbtics 0.1
set xtics 0.4

set palette defined (0 "#000000", 0.15 "#FF0000", 0.25 "#0000FF", 0.3 "#FFFFFF")

set xlabel "Fitness penalty ε"
set ylabel "Change period T"

set title "Mutation rate μ"
set origin 0.02,0
splot "env-switch-20-2-0-0.txt" u 1:2:3 w pm3d

set title "Bottleneck strength σ"
set origin 0.35,0
splot "env-switch-20-2-0-0.txt" u 1:2:4 w pm3d

set title " "
set xtics 0.1
unset pm3d
set origin 0.68,0.
set xlabel "Mutation rate μ"
set ylabel "Bottleneck strength σ"
plot "env-switch-20-2-0-0.txt" u 3:4 pt 7 ps 0.1
