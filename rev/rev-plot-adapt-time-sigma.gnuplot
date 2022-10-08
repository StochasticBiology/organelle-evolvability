reset
set multiplot
set size 0.3,1

#svg 800,400

unset key

set ytics 0.1
lmargin = 0.02

# the formatting of the output file is not compatible with Gnuplot's pm3d mode. these commands extract the data for three different mutation rates and cast them into new files in a format that is compatible
system("awk 'BEGIN{last = 0;}{if($2 == 8.000e-08) {if($3 != last) { print \" \"; last = $3; } print $0;}}' rev-adaptationtime-20-2-0.0000-100-1-0.txt > rev-adaptationtime-parsed-8.000e-08.txt")
system("awk 'BEGIN{last = 0;}{if($2 == 5.1200e-06) {if($3 != last) { print \" \"; last = $3; } print $0;}}' rev-adaptationtime-20-2-0.0000-100-1-0.txt > rev-adaptationtime-parsed-5.1200e-06.txt")
system("awk 'BEGIN{last = 0;}{if($2 == 5.2429e-03) {if($3 != last) { print \" \"; last = $3; } print $0;}}' rev-adaptationtime-20-2-0.0000-100-1-0.txt > rev-adaptationtime-parsed-5.2429e-03.txt")


set pm3d map corners2color c1
set xlabel "Fitness penalty ε"
set ylabel "Bottleneck strength σ"
set cbrange [-1:2000]

set xtics 0.5

set palette defined (-1 "#FFAAAA", -0.5 "#FFAAAA", -0.4 "#FFFFFF", 0.01 "#FFFFFF", 2000 "#8888FF")

set title "μ=8.0e-8"
set origin 0.+lmargin,0.
splot "rev-adaptationtime-parsed-8.000e-08.txt" u 1:3:4 w pm3d

set title "μ=5.1e-6"
set origin 0.33+lmargin,0.
splot "rev-adaptationtime-parsed-5.1200e-06.txt" u 1:3:4 w pm3d

set title "μ=5.2e-3"
set origin 0.66+lmargin,0.
splot "rev-adaptationtime-parsed-5.2429e-03.txt" u 1:3:4 w pm3d
