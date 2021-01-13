reset
set multiplot
set size 0.3,1

#svg 800,400

unset key

set ytics 0.1
lmargin = 0.02

# the formatting of the output file is not compatible with Gnuplot's pm3d mode. these commands extract the data for three different mutation rates and cast them into new files in a format that is compatible
system("awk 'BEGIN{last = 0;}{if($2 == 0.0033) {if($3 != last) { print \" \"; last = $3; } print $0;}}' adaptationtime-20-2-0.0000-100-1-0.txt > adaptationtime-parsed-0.0033.txt")
system("awk 'BEGIN{last = 0;}{if($2 == 0.0066) {if($3 != last) { print \" \"; last = $3; } print $0;}}' adaptationtime-20-2-0.0000-100-1-0.txt > adaptationtime-parsed-0.0066.txt")
system("awk 'BEGIN{last = 0;}{if($2 == 0.0099) {if($3 != last) { print \" \"; last = $3; } print $0;}}' adaptationtime-20-2-0.0000-100-1-0.txt > adaptationtime-parsed-0.0099.txt")


set pm3d map corners2color c1
set xlabel "Fitness penalty ε"
set ylabel "Bottleneck strength σ"
set cbrange [-1:2000]

set xtics 0.5

set palette defined (-1 "#FFAAAA", -0.5 "#FFAAAA", -0.4 "#FFFFFF", 0.01 "#FFFFFF", 2000 "#8888FF")

set title "μ=3.3e-3"
set origin 0.+lmargin,0.
splot "adaptationtime-parsed-0.0033.txt" u 1:3:4 w pm3d

set title "μ=6.7e-3"
set origin 0.33+lmargin,0.
splot "adaptationtime-parsed-0.0066.txt" u 1:3:4 w pm3d

set title "μ=0.01"
set origin 0.66+lmargin,0.
splot "adaptationtime-parsed-0.0099.txt" u 1:3:4 w pm3d
