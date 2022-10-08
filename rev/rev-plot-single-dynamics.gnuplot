reset
set multiplot
set pm3d map corners2color c1
unset colorbox

#svg 800,600

set cbrange [0:1]

yscale = 20.

set xtics 100
set ytics 0.5

set xrange [0:200]
set yrange [-2/yscale:22/yscale]
set palette defined (0 "white", 0.01 "#FFEEEE", 1 "#FF0000")
unset key
set size 0.18,0.35
set origin 0,0.66
set title "ε=0, μ=8.0e-8"
splot "rev-adaptation-20-2-0.0000-100-1-0-hist-0.0000-0.0000-8.0000e-08.txt" u 1:($2/yscale):3
set origin 0.16,0.66
set title "ε=0, μ=5.1e-6"
splot "rev-adaptation-20-2-0.0000-100-1-0-hist-0.0000-0.0000-5.1200e-06.txt" u 1:($2/yscale):3
set origin 0.33,0.66
set title "ε=0, μ=5.2e-3"
splot "rev-adaptation-20-2-0.0000-100-1-0-hist-0.0000-0.0000-5.2429e-03.txt" u 1:($2/yscale):3

set origin 0,0.33
set title "ε=0.625, μ=8.0e-8"
splot "rev-adaptation-20-2-0.0000-100-1-0-hist-0.0000-0.6250-8.0000e-08.txt" u 1:($2/yscale):3
set origin 0.16,0.33
set title "ε=0.625, μ=5.1e-6"
splot "rev-adaptation-20-2-0.0000-100-1-0-hist-0.0000-0.6250-5.1200e-06.txt" u 1:($2/yscale):3
set origin 0.33,0.33
set title "ε=0.625, μ=5.2e-3"
splot "rev-adaptation-20-2-0.0000-100-1-0-hist-0.0000-0.6250-5.2429e-03.txt" u 1:($2/yscale):3

set origin 0,0.
set title "ε=1.25, μ=8.0e-8"
splot "rev-adaptation-20-2-0.0000-100-1-0-hist-0.0000-1.2500-8.0000e-08.txt" u 1:($2/yscale):3
set origin 0.16,0.
set title "ε=1.25, μ=5.1e-6"
splot "rev-adaptation-20-2-0.0000-100-1-0-hist-0.0000-1.2500-5.1200e-06.txt" u 1:($2/yscale):3
set origin 0.33,0.
set title "ε=1.25, μ=5.2e-3"
splot "rev-adaptation-20-2-0.0000-100-1-0-hist-0.0000-1.2500-5.2429e-03.txt" u 1:($2/yscale):3


###################

set palette defined (0 "white", 0.01 "#EEEEFF", 1 "#0000FF")
unset key

set origin 0.5,0.66
set title "ε=0, μ=8.0e-8"
splot "rev-adaptation-20-2-0.0000-100-1-0-hist-0.2000-0.0000-8.0000e-08.txt" u 1:($2/yscale):3
set origin 0.66,0.66
set title "ε=0, μ=5.1e-6"
splot "rev-adaptation-20-2-0.0000-100-1-0-hist-0.2000-0.0000-5.1200e-06.txt" u 1:($2/yscale):3
set origin 0.83,0.66
set title "ε=0, μ=5.2e-3"
splot "rev-adaptation-20-2-0.0000-100-1-0-hist-0.2000-0.0000-5.2429e-03.txt" u 1:($2/yscale):3

set origin 0.5,0.33
set title "ε=0.625, μ=8.0e-8"
splot "rev-adaptation-20-2-0.0000-100-1-0-hist-0.2000-0.6250-8.0000e-08.txt" u 1:($2/yscale):3
set origin 0.66,0.33
set title "ε=0.625, μ=5.1e-6"
splot "rev-adaptation-20-2-0.0000-100-1-0-hist-0.2000-0.6250-5.1200e-06.txt" u 1:($2/yscale):3
set origin 0.83,0.33
set title "ε=0.625, μ=5.2e-3"
splot "rev-adaptation-20-2-0.0000-100-1-0-hist-0.2000-0.6250-5.2429e-03.txt" u 1:($2/yscale):3

set origin 0.5,0.
set title "ε=1.25, μ=8.0e-8"
splot "rev-adaptation-20-2-0.0000-100-1-0-hist-0.2000-1.2500-8.0000e-08.txt" u 1:($2/yscale):3
set origin 0.66,0.
set title "ε=1.25, μ=5.1e-6"
splot "rev-adaptation-20-2-0.0000-100-1-0-hist-0.2000-1.2500-5.1200e-06.txt" u 1:($2/yscale):3
set origin 0.83,0.
set title "ε=1.25, μ=5.2e-3"
splot "rev-adaptation-20-2-0.0000-100-1-0-hist-0.2000-1.2500-5.2429e-03.txt" u 1:($2/yscale):3

