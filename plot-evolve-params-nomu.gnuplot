reset
set multiplot
set pm3d map corners2color c1

#svg 800,300

set size 0.28,1
unset key

set cbrange [0:0.7]
set cbtics 0.1
set xtics 0.5
set xrange [0:1.5]

set palette defined (0 "#000000", 0.3 "#FF0000", 0.5 "#0000FF", 0.7 "#FFFFFF")

set xlabel "Fitness penalty ε"
set ylabel "Change period T"

set title "Mutation rate μ = 0.05"
set origin 0.02,0
splot "env-switch-20-2-0.0000-100-2-0.txt" u 1:2:4 w pm3d

set title "μ = 0.1"
set origin 0.35,0
splot "env-switch-20-2-0.0000-100-3-0.txt" u 1:2:4 w pm3d

set title "μ = 0.2"
set origin 0.68,0.
splot "env-switch-20-2-0.0000-100-4-0.txt" u 1:2:4 w pm3d
