# compile workhorse code
gcc -o3 odna-sim-rev.c -lm -o odna-sim-rev.ce

# the commands below run different experiments in parallel. if multiple cores are unavailable, you may prefer to serialise this -- just remove the "&" characters from each command

# arguments are
# [experiment] [expt param] [fitness penalty] [population size] [offspring number] [oDNAs per cell] [off-target mutation frequency]

# quick adaptation proportion simulation for comparisons
./odna-sim-rev.ce 0 2 0 20 2 100 0 > tmp0 &

# adaptation proportion with different fitness functions
./odna-sim-rev.ce 0 0 0 20 2 100 0 > tmp1 &
./odna-sim-rev.ce 0 0 1 20 2 100 0 > tmp2 &
./odna-sim-rev.ce 0 0 2 20 2 100 0 > tmp3 &
./odna-sim-rev.ce 0 0 3 20 2 100 0 > tmp4 &

# adaptation times scanning over different parameters
./odna-sim-rev.ce 1 0 0 20 2 100 0 > tmp5 &
./odna-sim-rev.ce 1 1 0 20 2 100 0 > tmp6 &

# dynamic environments with different fitness functions
./odna-sim-rev.ce 2 0 0 20 2 100 0 > tmp7 &
./odna-sim-rev.ce 2 0 1 20 2 100 0 > tmp8 &
# dynamic environments without mutation rate adaptation
./odna-sim-rev.ce 2 2 0 20 2 100 0 > tmp9 &
./odna-sim-rev.ce 2 3 0 20 2 100 0 > tmp10 &
./odna-sim-rev.ce 2 4 0 20 2 100 0 > tmp11 &

# adaptation proportion with different off-target mutation rates
./odna-sim-rev.ce 0 2 0 20 2 100 10 > tmp12 &
./odna-sim-rev.ce 0 2 0 20 2 100 50 > tmp13 &
./odna-sim-rev.ce 0 2 0 20 2 100 100 > tmp14 &

# adaptation proportion with different oDNA counts per cell
./odna-sim-rev.ce 0 2 0 20 2 10 0 > tmp15 &
./odna-sim-rev.ce 0 2 0 20 2 1000 0 > tmp16 &

# adaptation proportion with different demographics
./odna-sim-rev.ce 0 2 0 20 5 100 0 > tmp17 &
./odna-sim-rev.ce 0 2 0 50 2 100 0 > tmp18 &
./odna-sim-rev.ce 0 2 0 50 5 100 0 > tmp19 &
./odna-sim-rev.ce 0 2 0 100 2 100 0 > tmp20 &
./odna-sim-rev.ce 0 2 0 100 5 100 0 > tmp21 &

# adaptation proportion for time traces of individual runs
./odna-sim-rev.ce 0 1 0 20 2 100 0 > tmp22 &

# dynamic environments for time traces of individual runs
./odna-sim-rev.ce 2 1 0 20 2 100 0 > tmp23 &
