reset
set multiplot
set size 0.28,1

#svg 800,400

unset key

set ytics 0.1

system("awk 'BEGIN{last = 0;}{if($2 == 0.001) {if($3 != last) { print \" \"; last = $3; } print $0;}}' adaptationtime-20-2-0-0.txt > adaptationtime-20-2-0-0-parsed-0.001.txt")
system("awk 'BEGIN{last = 0;}{if($2 == 0.01) {if($3 != last) { print \" \"; last = $3; } print $0;}}' adaptationtime-20-2-0-0.txt > adaptationtime-20-2-0-0-parsed-0.010.txt")
system("awk 'BEGIN{last = 0;}{if($2 == 0.04) {if($3 != last) { print \" \"; last = $3; } print $0;}}' adaptationtime-20-2-0-0.txt > adaptationtime-20-2-0-0-parsed-0.040.txt")

set pm3d map corners2color c1
set xlabel "Fitness penalty ε"
set ylabel "Bottleneck strength σ"
set cbrange [-1:2000]

set xtics 0.5

set palette defined (-1 "#FFAAAA", -0.5 "#FFAAAA", -0.4 "#FFFFFF", 0.01 "#FFFFFF", 2000 "#8888FF")

set title "μ=0.001"
set origin 0.02,0.
splot "adaptationtime-20-2-0-0-parsed-0.001.txt" u 1:3:4 w pm3d
#splot "adaptation-0-0.txt" u ($2 == 0.01 ? $1 : 1/0):3:4 w pm3d notitle

set title "μ=0.01"
set origin 0.35,0.
splot "adaptationtime-20-2-0-0-parsed-0.010.txt" u 1:3:4 w pm3d
#splot "adaptation-0-0.txt" u ($2 == 0.03 ? $1 : 1/0):3:4 w pm3d notitle

set title "μ=0.04"
set origin 0.68,0.
splot "adaptationtime-20-2-0-0-parsed-0.040.txt" u 1:3:4 w pm3d
#splot "adaptation-0-0.txt" u ($2 == 0.03 ? $1 : 1/0):3:4 w pm3d notitle
