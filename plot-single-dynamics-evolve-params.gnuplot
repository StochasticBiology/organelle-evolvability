reset
set multiplot
set pm3d map corners2color c1
unset colorbox

#svg 800,400

set cbrange [0:1]

yscale = 20
lmargin = 0.03

set xtics 250

set yrange [-2/yscale:22/yscale]
set palette defined (0 "white", 0.01 "#FFEEEE", 1 "#FF0000")
unset key
set size 0.3,0.35

set ytics 0.5

set origin 0.+lmargin,0.6
set title "T=0, ε=0.1"
splot "env-switch-20-2-0.0000-100-1-0-single-hist-switch-0-eps-0.1000.txt" u 1:($2/yscale):3, "env-switch-20-2-0.0000-100-1-0-switch-0-eps-0.1000.txt" u 1:4:(2) w l lc rgbcolor "#888888", "" u 1:6:(2) w l lc rgbcolor "#0000FF"
set origin 0.33+lmargin,0.6
set title "T=0, ε=0.2"
splot "env-switch-20-2-0.0000-100-1-0-single-hist-switch-0-eps-0.2000.txt" u 1:($2/yscale):3, "env-switch-20-2-0.0000-100-1-0-switch-0-eps-0.2000.txt" u 1:4:(2) w l lc rgbcolor "#888888", "" u 1:6:(2) w l lc rgbcolor "#0000FF"
set origin 0.66+lmargin,0.6
set title "T=0, ε=0.5"
splot "env-switch-20-2-0.0000-100-1-0-single-hist-switch-0-eps-0.5000.txt" u 1:($2/yscale):3, "env-switch-20-2-0.0000-100-1-0-switch-0-eps-0.5000.txt" u 1:4:(2) w l lc rgbcolor "#888888", "" u 1:6:(2) w l lc rgbcolor "#0000FF"

set origin 0.+lmargin,0.3
set title "T=20, ε=0.1"
splot "env-switch-20-2-0.0000-100-1-0-single-hist-switch-20-eps-0.1000.txt" u 1:($2/yscale):3, "env-switch-20-2-0.0000-100-1-0-switch-20-eps-0.1000.txt" u 1:4:(2) w l lc rgbcolor "#888888", "" u 1:6:(2) w l lc rgbcolor "#0000FF"
set origin 0.33+lmargin,0.3
set title "T=20, ε=0.2"
splot "env-switch-20-2-0.0000-100-1-0-single-hist-switch-20-eps-0.2000.txt" u 1:($2/yscale):3, "env-switch-20-2-0.0000-100-1-0-switch-20-eps-0.2000.txt" u 1:4:(2) w l lc rgbcolor "#888888", "" u 1:6:(2) w l lc rgbcolor "#0000FF"
set origin 0.66+lmargin,0.3
set title "T=20, ε=0.5"
splot "env-switch-20-2-0.0000-100-1-0-single-hist-switch-20-eps-0.5000.txt" u 1:($2/yscale):3, "env-switch-20-2-0.0000-100-1-0-switch-20-eps-0.5000.txt" u 1:4:(2) w l lc rgbcolor "#888888", "" u 1:6:(2) w l lc rgbcolor "#0000FF"

set origin 0.+lmargin,0.
set title "T=40, ε=0.1"
splot "env-switch-20-2-0.0000-100-1-0-single-hist-switch-40-eps-0.1000.txt" u 1:($2/yscale):3, "env-switch-20-2-0.0000-100-1-0-switch-40-eps-0.1000.txt" u 1:4:(2) w l lc rgbcolor "#888888", "" u 1:6:(2) w l lc rgbcolor "#0000FF"
set origin 0.33+lmargin,0.
set title "T=40, ε=0.2"
splot "env-switch-20-2-0.0000-100-1-0-single-hist-switch-40-eps-0.2000.txt" u 1:($2/yscale):3, "env-switch-20-2-0.0000-100-1-0-switch-40-eps-0.2000.txt" u 1:4:(2) w l lc rgbcolor "#888888", "" u 1:6:(2) w l lc rgbcolor "#0000FF"
set origin 0.66+lmargin,0.
set title "T=40, ε=0.5"
splot "env-switch-20-2-0.0000-100-1-0-single-hist-switch-40-eps-0.5000.txt" u 1:($2/yscale):3, "env-switch-20-2-0.0000-100-1-0-switch-40-eps-0.5000.txt" u 1:4:(2) w l lc rgbcolor "#888888", "" u 1:6:(2) w l lc rgbcolor "#0000FF"

