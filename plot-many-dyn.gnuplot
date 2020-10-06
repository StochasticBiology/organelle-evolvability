reset
set multiplot
set pm3d map corners2color c1
unset colorbox

#svg 800,400

set cbrange [0:1]

yscale = 20.

set xtics 250

set yrange [-2/yscale:22/yscale]
set palette defined (0 "white", 0.01 "#FFEEEE", 1 "#FF0000")
unset key
set size 0.3,0.4

set ytics 0.5

set origin 0.02,0.6
set title "T=0, ε=0.1"
splot "env-switch-20-2-1-0-single-hist-switch-0-eps-0.100.txt" u 1:($2/yscale):3, "env-switch-20-2-1-0-switch-0-eps-0.100.txt" u 1:3:(2) w l lc rgbcolor "#888888", "" u 1:5:(2) w l lc rgbcolor "#0000FF"
set origin 0.35,0.6
set title "T=0, ε=0.2"
splot "env-switch-20-2-1-0-single-hist-switch-0-eps-0.200.txt" u 1:($2/yscale):3, "env-switch-20-2-1-0-switch-0-eps-0.200.txt" u 1:3:(2) w l lc rgbcolor "#888888", "" u 1:5:(2) w l lc rgbcolor "#0000FF"
set origin 0.68,0.6
set title "T=0, ε=0.5"
splot "env-switch-20-2-1-0-single-hist-switch-0-eps-0.500.txt" u 1:($2/yscale):3, "env-switch-20-2-1-0-switch-0-eps-0.500.txt" u 1:3:(2) w l lc rgbcolor "#888888", "" u 1:5:(2) w l lc rgbcolor "#0000FF"

set origin 0.02,0.3
set title "T=20, ε=0.1"
splot "env-switch-20-2-1-0-single-hist-switch-20-eps-0.100.txt" u 1:($2/yscale):3, "env-switch-20-2-1-0-switch-20-eps-0.100.txt" u 1:3:(2) w l lc rgbcolor "#888888", "" u 1:5:(2) w l lc rgbcolor "#0000FF"
set origin 0.35,0.3
set title "T=20, ε=0.2"
splot "env-switch-20-2-1-0-single-hist-switch-20-eps-0.200.txt" u 1:($2/yscale):3, "env-switch-20-2-1-0-switch-20-eps-0.200.txt" u 1:3:(2) w l lc rgbcolor "#888888", "" u 1:5:(2) w l lc rgbcolor "#0000FF"
set origin 0.68,0.3
set title "T=20, ε=0.5"
splot "env-switch-20-2-1-0-single-hist-switch-20-eps-0.500.txt" u 1:($2/yscale):3, "env-switch-20-2-1-0-switch-20-eps-0.500.txt" u 1:3:(2) w l lc rgbcolor "#888888", "" u 1:5:(2) w l lc rgbcolor "#0000FF"

set origin 0.02,0.
set title "T=50, ε=0.1"
splot "env-switch-20-2-1-0-single-hist-switch-50-eps-0.100.txt" u 1:($2/yscale):3, "env-switch-20-2-1-0-switch-50-eps-0.100.txt" u 1:3:(2) w l lc rgbcolor "#888888", "" u 1:5:(2) w l lc rgbcolor "#0000FF"
set origin 0.35,0.
set title "T=50, ε=0.2"
splot "env-switch-20-2-1-0-single-hist-switch-50-eps-0.200.txt" u 1:($2/yscale):3, "env-switch-20-2-1-0-switch-50-eps-0.200.txt" u 1:3:(2) w l lc rgbcolor "#888888", "" u 1:5:(2) w l lc rgbcolor "#0000FF"
set origin 0.68,0.
set title "T=50, ε=0.5"
splot "env-switch-20-2-1-0-single-hist-switch-50-eps-0.500.txt" u 1:($2/yscale):3, "env-switch-20-2-1-0-switch-50-eps-0.500.txt" u 1:3:(2) w l lc rgbcolor "#888888", "" u 1:5:(2) w l lc rgbcolor "#0000FF"

