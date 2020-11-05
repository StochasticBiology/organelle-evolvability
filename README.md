Organelle evolvability
====

All numerical experiments are performed by **mt-evol-pop.c**, which takes different command-line parameters to do different experiments. First argument is experiment label, second is population size, third is number of offspring per individual. Simulations produce output text files, which are plotted in Gnuplot by the various ***.gnuplot** scripts.

**run.sh** -- wrapper script to compile and run all experiments. By default these are run in parallel; see the file for how to serialise for machines without multiple cores.

**mt-evol-pop.c** -- workhorse simulation code.

Gnuplot scripts for figures:
* Fig 1 --  plot-adapt-time.gnuplot
* Fig 2 --  plot-many.gnuplot
* Fig 3 --  plot-timescale-2.gnuplot
* Fig 4 --  plot-evolution.gnuplot and plot-many-dyn.gnuplot
* Fig 5 --  [illustration]
* Fig S1 -- plot-adapt-time-popn.gnuplot
* Fig S2 -- plot-adapt-alts.gnuplot
* Fig S3 -- plot-evolution-bneck.gnuplot
