# plot manuscript figures using gnuplot
# post-review: mutation rate ranegs expanded in these versions ("rev-" prefix added)
# outputs SVG files; manual annotations added subsequently

### main text figures

# fig 1
gnuplot -e 'set term svg size 800,600; set output "rev-plot-adapt-time-popn.svg"; load "rev-plot-adapt-time-popn.gnuplot"; exit;'

# fig 2
gnuplot -e 'set term svg size 800,600; set output "rev-plot-single-dynamics.svg"; load "rev-plot-single-dynamics.gnuplot"; exit;'

# fig 3
gnuplot -e 'set term svg size 800,400; set output "rev-plot-adapt-time-sigma.svg"; load "rev-plot-adapt-time-sigma.gnuplot"; exit;'


# fig s2
gnuplot -e 'set term svg size 1024,600; set output "rev-plot-adapt-alpha.svg"; load "rev-plot-adapt-alpha.gnuplot"; exit;'


# fig s4
gnuplot -e 'set term svg size 600,800; set output "rev-plot-adapt-alts.svg"; load "rev-plot-adapt-alts.gnuplot"; exit;'





