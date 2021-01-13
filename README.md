Organelle evolvability
====

All numerical experiments are performed by **odna-sim.c**, which takes different command-line parameters to do different experiments. The argument structure, explained further within the file, is
[experiment] [expt param] [fitness penalty] [population size] [offspring number] [oDNAs per cell] [off-target mutation frequency]

Simulations produce output text files, which are plotted in Gnuplot by the various **.gnuplot** scripts. **plot-all.sh** invokes all these scripts to automatically produce the output; it also describes which plots correspond to which manuscript figures.

**run-set.sh** is wrapper script to compile and run all experiments. By default these are run in parallel; see the file for how to serialise for machines without multiple cores.
