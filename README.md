Organelle evolvability
====

All numerical experiments are performed by `odna-sim.c`, which takes different command-line parameters to do different experiments. The argument structure, explained further within the file, is
[experiment] [expt param] [fitness penalty] [population size] [offspring number] [oDNAs per cell] [off-target mutation frequency] .

* [experiment]:
    * 0 = adaptation proportion
    * 1 = adaptation time
    * 2 = dynamic environments
* [expt param]:
    * (for adaptation experiments):
    * 0 = fine-grained steps
    * 1 = coarse-grained steps through parameter space
    * (for dynamic environments):
    * 0 = fine-grained steps
    * 1 = coarse-grained steps
    * 2, 3, 4 = fine-grained steps w/o mu evolution
* [fitness penalty]:
    * 0 = -eps, 0 < h < 1
    * 1 = 4 eps (h-0.5)^2 - eps
    * 2 = -eps, h > 0.5
    * 3 = -eps, h > 0.1

For example (fast and simple):

`./odna-sim.ce 4 1 0 20 2 100 0`

Simulations produce output text files, which are plotted in Gnuplot by the various `.gnuplot` scripts. `plot-all.sh` invokes all these scripts to automatically produce the output; it also describes which plots correspond to which manuscript figures.

`run-set.sh` is a wrapper script to compile and run all experiments. By default these are run in parallel; see the file for how to serialise for machines without multiple cores.

Peer review edits
----

Following peer review, the range of simulated mutation rates was expanded. The simulation and plotting code for the new figures, along with a wrapper script, are in the `rev` directory. The protocol for running these experiments is analogous to the above; use `run-set-rev.sh` and `rev-plot-all.sh` as wrappers.
