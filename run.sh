# this wrapper script compiles and runs the set of experiments needed for figures in the manuscript
# by default these will all be run in parallel, which may be a bit much for machines with low numbers of cores. remove the "&"s in the lines below to serialise
# some simulations may take ~24h on a modern machine

gcc -o3 mt-evol-pop.c -lm -o mt-evol-pop.ce

# evolution in dynamic environments with different penalties and fitness functions
./mt-evol-pop.ce 0 20 2 > tmp0 &
./mt-evol-pop.ce 1 20 2 > tmp1 &
./mt-evol-pop.ce 2 20 2 > tmp2 &
./mt-evol-pop.ce 3 20 2 > tmp3 &

# adaptation (simple population proportion after fixed time)
./mt-evol-pop.ce 4 20 2 > tmp4 &
./mt-evol-pop.ce 5 20 2 > tmp5 &
./mt-evol-pop.ce 6 20 2 > tmp6 &
./mt-evol-pop.ce 7 20 2 > tmp7 &

# adaptation (measuring mean time)
./mt-evol-pop.ce 8 20 2 > tmp8 &
./mt-evol-pop.ce 9 20 2 > tmp9 &

# adaptation (simple proportion with different fitness functions)
./mt-evol-pop.ce 10 20 2 > tmp10 &
./mt-evol-pop.ce 11 20 2 > tmp11 &

# adaptation with different demographic variables
./mt-evol-pop.ce 8 50 2 > tmp12 &
./mt-evol-pop.ce 8 100 2 > tmp13 &
./mt-evol-pop.ce 8 20 5 > tmp14 &
./mt-evol-pop.ce 8 50 5 > tmp15 &
./mt-evol-pop.ce 8 100 5 > tmp16 &

# fixed mutation rate, watch bottleneck evolve
./mt-evol-pop.ce 12 20 2 > tmp12 &
./mt-evol-pop.ce 13 20 2 > tmp13 &
./mt-evol-pop.ce 14 20 2 > tmp14 &
