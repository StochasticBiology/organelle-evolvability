# plot manuscript figures using gnuplot
# outputs SVG files; manual annotations added subsequently

### main text figures

# fig 1
gnuplot -e 'set term svg size 800,600; set output "plot-adapt-time-popn.svg"; load "plot-adapt-time-popn.gnuplot"; exit;'

# fig 2
gnuplot -e 'set term svg size 800,600; set output "plot-single-dynamics.svg"; load "plot-single-dynamics.gnuplot"; exit;'

# fig 3
gnuplot -e 'set term svg size 800,400; set output "plot-adapt-time-sigma.svg"; load "plot-adapt-time-sigma.gnuplot"; exit;'

# fig 4a-c
gnuplot -e 'set term svg size 800,400; set output "plot-evolve-params.svg"; load "plot-evolve-params.gnuplot"; exit;'

# fig 4d-f
gnuplot -e 'set term svg size 800,600; set output "plot-single-dynamics-evolve-params.svg"; load "plot-single-dynamics-evolve-params.gnuplot"; exit;'

### SI figures

# fig s1
gnuplot -e 'set term svg size 1024,480; set output "plot-adapt-demography.svg"; load "plot-adapt-demography.gnuplot"; exit;'

# fig s2
gnuplot -e 'set term svg size 1024,600; set output "plot-adapt-alpha.svg"; load "plot-adapt-alpha.gnuplot"; exit;'

# fig s3
gnuplot -e 'set term svg size 800,400; set output "plot-adapt-n.svg"; load "plot-adapt-n.gnuplot"; exit;'

# fig s4
gnuplot -e 'set term svg size 600,800; set output "plot-adapt-alts.svg"; load "plot-adapt-alts.gnuplot"; exit;'

# fig s5
gnuplot -e 'set term svg size 800,400; set output "plot-evolve-params-nomu.svg"; load "plot-evolve-params-nomu.gnuplot"; exit;'





