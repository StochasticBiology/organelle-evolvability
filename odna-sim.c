// simulates organelle DNA populations adapting to new environment(s)

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define RND drand48()

// global settings
int NPOP = 20;         // number of cells in population
int NOFF = 2;          // number of offspring per cell
int NPARAM = 100;      // number of oDNAs per cell (scales mutational variance)
double ALPHA = 0;      // frequency of off-target mutations

#define MAXT 500       // timescale of simulation
#define BIN 20         // number of bins for heteroplasmy distribution
#define NHIST (BIN+2)  // used to allocate memory for histograms

// structure describing a cell
typedef struct tagCell
{
  double h, hd;     // heteroplasmy level
  double f;         // fitness
  double mu;        // mutation rate
  double sigma;     // segregation (bottleneck) strength
  double mumu;      // mutation rate parameter mutation rate
  double sigmamu;   // segregation strength parameter mutation rate
} Cell;

// produce a gaussian-distributed random variate, from the GSL library
double gsl_ran_gaussian(const double sigma)
{
  double x, y, r2;

  do
    {
      /* choose x,y in uniform square (-1,-1) to (+1,+1) */

      x = -1 + 2 * RND;
      y = -1 + 2 * RND;

      /* see if it is in the unit circle */
      r2 = x * x + y * y;
    }
  while (r2 > 1.0 || r2 == 0);

  /* Box-Muller transform */
  return sigma * y * sqrt (-2.0 * log (r2) / r2);
}

// apply a model "bottleneck" to a daughter cell
double bottleneck(double h, double sigma)
{
  double new_h;

  // if homoplasmic, no change is possible
  if(h == 0) return 0;
  if(h == 1) return 1;

  // apply a truncated normal perturbation with variance prop to h(1-h)
  // i.e. standard deviation prop to sqrt(h(1-h))
  // not a perfect model, but often OK, and simple
  new_h = h + gsl_ran_gaussian(sqrt(sigma*(h*(1.-h))));
  if(new_h < 0) return 0;
  if(new_h > 1) return 1;
  
  return new_h;
}

// compute fitness of a cell given heteroplasmy level h
// env gives current environment
// epsilon is the fitness penalty for heteroplasmy
// penaltytype describes whether (0) any heteroplasmy 0<h<1 experiences the same penalty or (1) heteroplasmy penalty is quadratic
// the sum of the heteroplasmy penalty and the enviromental contribution is logit transformed to get a fitness between 0 and 1
double fitness(double h, double hd, int env, double epsilon, int penaltytype)
{
  double f = 0;

  switch(penaltytype)
    {
    case 0: if(h != 0 && h != 1) f -= epsilon; break; // uniform penalty
    case 1: f += (4.*epsilon*(h-0.5)*(h-0.5) - epsilon); break; // quadratic penalty
    case 2: if(h > 0.5) f -= epsilon; break; // big threshold
    case 3: if(h > 0.1) f -= epsilon; break; // small threshold
    }

  // add environmental contribution
  if(env == 0) f += -h;
  else f += h;

  if(ALPHA)
    {
      f -= hd;
    }
  
  // transform
  // higher scaling factor = sharper switch
  return 1./(1.+exp(-2.*f));
}

// constrain a value to lie between 0 and 1
double constrain(double x)
{
  if(x < 0) return 0;
  if(x > 1) return 1;
  return x;
}

// simulate the system under given conditions
// C is the cell population, outC is a historical record of the population
// hist stores historical histograms of heteroplasmy level
// maxt is simulation timescale, env is (starting) environment
// penaltytype and epsilon describe fitness function (see fitness(...))
// switchenv determines whether, and at what rate, the environment is switched
int Simulate(Cell *C, Cell *outC, double *hist, int maxt, int env, int penaltytype, double epsilon, int switchenv, int stopadapt)
{
  Cell NC[NOFF*NPOP];
  int i, j, t;
  double daughter_sum[NOFF*NPOP];
  double r;
    
  // loop through time
  for(t = 0; t < maxt; t++)
    {
      // if we're switching environments, and it's time to do so
      if(switchenv != 0 && t % switchenv == 0) env = 1-env;

      // loop through cells
      for(i = 0; i < NPOP; i++)
	{
	  // each cell produces NOFF daughters
	  for(j = 0; j < NOFF; j++)
	    {
	      // copy mother
	      NC[NOFF*i+j] = C[i];

	      // impose mutational change

	      if(ALPHA)
		{
		  double mu = C[i].mu;
		  double mud = ALPHA*C[i].mu;
		  double h0 = C[i].h;
		  double hd = C[i].hd;
		  double n = NPARAM;
		  double hmean, hvar, hdmean, hdvar;
		  double tmph, tmphd;
		  
		  hmean = (-mu + h0*(-1+2*mu+mud))/(mud-1);
		  hvar =  (-1./(n*(hd-1)*(mud-1)*(mud-1)*(mud-1)*(mud-1))) * ( 2*(1-2*h0)*(1-2*h0)*mu*mu*mu + (1 + 2*(-1+h0)*h0)*mu*(-1+mud)*(-1+mud) - (-1+h0)*h0*(-1+mud)*(-1+mud)*mud + (1-2*h0)*(1-2*h0)*mu*mu*(-2+3*mud) );
		  //	  hvar = ( 2*(1-2*h0)*(1-2*h0)*mu*mu*mu + (1-2*h0)*(1-2*h0)*mu*mu*(mud-2) + (-1 + 2*(-1+h0)*h0)*mu*(-1+mud)*(-1+mud) + (-1+h0)*h0*(-1+mud)*(-1+mud)*mud ) / ( (-1+hd)*n*(-1+mud)*(-1+mud)*(-1+mud)*(-1+mud) );
		  hdmean = hd + mud*(1-hd);
		  hdvar = mud*(1-hd)/n;
	      
		  tmph = constrain(hmean + gsl_ran_gaussian(sqrt(hvar)));
		  tmphd = constrain(hdmean + gsl_ran_gaussian(sqrt(hdvar)));
	      
		  // impose bottleneck
		  NC[NOFF*i+j].h = bottleneck(tmph, C[i].sigma);
		  NC[NOFF*i+j].hd = bottleneck(tmphd, C[i].sigma);
		}
	      else
		{
		  double mu = C[i].mu;
		  double h = C[i].h;
		  double n = NPARAM;
		  double hmean, hvar;
		  double tmph;
		  
		  hmean = h + mu*(1.-2.*h);
		  hvar = mu/n;

		  tmph = constrain(hmean + gsl_ran_gaussian(sqrt(hvar)));
	      
		  // impose bottleneck
		  NC[NOFF*i+j].h = bottleneck(tmph, C[i].sigma);
		}
	      
	      // mutation rate and segregation strength change according to parameter mutation rates  
	      NC[NOFF*i+j].mu = constrain(NC[NOFF*i+j].mu + gsl_ran_gaussian(NC[NOFF*i+j].mumu));
    	      NC[NOFF*i+j].sigma = constrain(NC[NOFF*i+j].sigma + gsl_ran_gaussian(NC[NOFF*i+j].sigmamu));
	    }
	}

      // compute fitness for each daughter
      for(i = 0; i < NOFF*NPOP; i++)
	{
	  NC[i].f = fitness(NC[i].h, NC[i].hd, env, epsilon, penaltytype);

	  // build the roulette wheel for selection
	  daughter_sum[i] = (i == 0 ? NC[0].f : daughter_sum[i-1]+NC[i].f);
	}

      // initialise summary mean structure
      outC[t].mu = outC[t].mumu = outC[t].sigma = outC[t].sigmamu = outC[t].h = outC[t].hd = 0;
      
      // loop through individuals that will make up next generation
      for(i = 0; i < NPOP; i++)
	{
	  // roll roulette ball and find which mother cell it lands on (j)
	  r = RND*daughter_sum[NOFF*NPOP-1];
	  for(j = 0; r > daughter_sum[j]; j++);

	  // copy chosen mother to next generation
	  C[i] = NC[j];

	  // record summary statistics
	  // historic heteroplasmy histogram is 2D: t*NHIST + h is h'th bin for t'th time
	  if(hist != NULL)
	    {
	      double forhist = C[i].h;
	      if(isnan(forhist)) forhist = 0;
	      hist[t*NHIST + (int)(forhist*BIN)] += 1./NPOP;
	    }
	  outC[t].h += C[i].h;
	  outC[t].hd += C[i].hd;
	  outC[t].mu += C[i].mu;
	  outC[t].mumu += C[i].mumu;
	  outC[t].sigma += C[i].sigma;
	  outC[t].sigmamu += C[i].sigmamu;
	  //	  printf("%.4f ", C[i].h);
	}
      
      // normalise summary stats
      outC[t].h /= NPOP;
      outC[t].hd /= NPOP;
      outC[t].mu /= NPOP;
      outC[t].mumu /= NPOP;
      outC[t].sigma /= NPOP;
      outC[t].sigmamu /= NPOP;

      if(stopadapt == 1 && outC[t].h > 0.75) return t;
    }
  return t;
}

// response of the system to changing environments
void DynamicEnvironments(int expt, int penaltytype)
{
  Cell *outC, C[NPOP];
  double *hist, *tmphist;
  int t;
  int i, it;
  double epsilon;
  char str[100];
  FILE *fp, *fp1;
  int envswitch;
  double meanmu, meansigma, meansum;
  double envswitchstep, epsilonstep;
  int NIT;

  // allocate memory to store behaviour
  outC = (Cell*)malloc(sizeof(Cell)*MAXT);
  hist = (double*)malloc(sizeof(double)*MAXT*NHIST);
  tmphist = (double*)malloc(sizeof(double)*MAXT*NHIST);

  // decide which meta-parameters to use (coarse or fine steps through param space)
  switch(expt)
    {
    case 1: envswitchstep = 20; epsilonstep = 0.1; NIT = 5; break;
    default: envswitchstep = 2; epsilonstep = 0.01; NIT = 100; break;
    }

  // initialise histogram
  for(i = 0; i < MAXT*NHIST; i++)
    hist[i] = 0;

  // open summary file for output
  sprintf(str, "env-switch-%i-%i-%.4f-%i-%i-%i.txt", NPOP, NOFF, ALPHA, NPARAM, expt, penaltytype);
  fp1 = fopen(str, "w");

  // loop through parameter space of switching frequency and heteroplasmy penalty
  for(envswitch = 0; envswitch <= 100; envswitch += envswitchstep)
    {
      for(epsilon = 0; epsilon < 1.5; epsilon += epsilonstep)
	{
	  printf("Dyn env expt %i %f\n", envswitch, epsilon);
	  meanmu = meansigma = meansum = 0;

	  // loop through iterations
	  for(it = 0; it <= NIT; it++)
	    {
	      // initialise population
	      for(i = 0; i < NPOP; i++)
		{
		  C[i].h = 0;
		  C[i].hd = 0;
		  C[i].sigma = 0;
		  C[i].sigmamu = 0.01;
		  switch(expt)
		    {
		    case 2: C[i].mu = 0.05; C[i].mumu = 0; break;
	            case 3: C[i].mu = 0.1; C[i].mumu = 0; break;
		    case 4: C[i].mu = 0.2; C[i].mumu = 0; break;
		    default: C[i].mu = 0; C[i].mumu = 0.01; break;
		    }
		}

	      // initialise histogram for this iteration
	      for(i = 0; i < MAXT*NHIST; i++)
		tmphist[i] = 0;

	      // simulate
	      Simulate(C, outC, tmphist, MAXT, 1, penaltytype, epsilon, envswitch, 0);

	      // update overall histogram
	      for(i = 0; i < MAXT*NHIST; i++)
		hist[i] += tmphist[i];

	      // for some parameterisations and iterations, output example files
	      if(it == 0 && (envswitch == 0 || envswitch == 20 || envswitch == 40) && (fabs(epsilon-0.1) < 0.001 || fabs(epsilon-0.2) < 0.001 || fabs(epsilon-0.5) < 0.001))
		{
		  // summary statistics file
		  sprintf(str, "env-switch-%i-%i-%.4f-%i-%i-%i-switch-%i-eps-%.4f.txt", NPOP, NOFF, ALPHA, NPARAM, expt, penaltytype, envswitch, epsilon);
		  fp = fopen(str, "w");
		  for(t = 0; t < MAXT; t++)
		    {
		      fprintf(fp, "%i %.4f %.4f %.4f %.4f %.4f %.4f\n", t, outC[t].h, outC[t].hd, outC[t].mu, outC[t].mumu, outC[t].sigma, outC[t].sigmamu);
		    }
		  fclose(fp);

		  // if we're outputting distributional detail (for the coarse-grained parameter space exploration)
		  if(expt == 1)
		    {
		      // single-iteration heteroplasmy level histogram file
		      sprintf(str, "env-switch-%i-%i-%.4f-%i-%i-%i-single-hist-switch-%i-eps-%.4f.txt", NPOP, NOFF, ALPHA, NPARAM, expt, penaltytype, envswitch, epsilon);
		      fp = fopen(str, "w");
		      for(t = 0; t < MAXT; t++)
			{
			  for(i = 0; i < NHIST; i++)
			    {
			      fprintf(fp, "%i %i %f\n", t, i, tmphist[t*NHIST + i]);
			    }
			  fprintf(fp, "\n");
			}
		      fclose(fp);
		    }
		}

	      // update summary statistics
	      meanmu += outC[MAXT-1].mu;
	      meansigma += outC[MAXT-1].sigma;
	      meansum += outC[MAXT-1].mu+outC[MAXT-1].sigma;
   	    }
	  // write to summary file
	  fprintf(fp1, "%.4f %i %f %f %f\n", epsilon, envswitch, meanmu/NIT, meansigma/NIT, meansum/NIT);

	  // output mean heteroplasmy level histogram to file
	  /*	  if(expt == 1)
		  {
		  sprintf(str, "env-switch-%i-%i-%i-%i-mean-hist-switch-%i-eps-%.4f.txt", NPOP, NOFF, expt, penaltytype, envswitch, epsilon);
		  fp = fopen(str, "w");
		  for(t = 0; t < MAXT; t++)
		  {
		  for(i = 0; i < NHIST; i++)
		  {
		  fprintf(fp, "%i %i %f\n", t, i, hist[t*NHIST + i]/NIT);
		  }
		  fprintf(fp, "\n");
		  }
		  fclose(fp);
		  }*/
	}
      fprintf(fp1, "\n");
      
    }
  fclose(fp1);

  // free up allocated memory
  free(outC);
  free(tmphist);
  free(hist);
}

// simulate adaptation to new environment -- all oDNAs initially type A, then switch to environment B at t = 0
void Adaptation(int expt, int penaltytype)
{
  Cell *outC, C[NPOP];
  int i, t;
  double epsilon, mu, sigma;
  char str[100];
  FILE *fp, *fp1;
  int envswitch;
  double *hist;
  double sigmastep, epsilonstep, mustep;
  double meanh, meanhd;
  int it, NIT;

  // allocate memory for output
  outC = (Cell*)malloc(sizeof(Cell)*MAXT);
  hist = (double*)malloc(sizeof(double)*MAXT*NHIST);

  // decide which meta-parameters to use (coarse or fine steps through param space)
  switch(expt)
    {
    case 0: sigmastep = 0.01; epsilonstep = 0.025; mustep = 0.0002; NIT = 10; break;
    case 1: sigmastep = 0.2; epsilonstep = 0.625; mustep = 0.0033; NIT = 1; break;
    case 2: sigmastep = 0.02; epsilonstep = 0.025; mustep = 0.0002; NIT = 3; break;
    }

  // open summary file for output
  sprintf(str, "adaptation-%i-%i-%.4f-%i-%i-%i.txt", NPOP, NOFF, ALPHA, NPARAM, expt, penaltytype);
  fp = fopen(str, "w");

  // loop through parameter space of bottleneck strength, heteroplasmy penalty, mutation rate
  for(sigma = 0; sigma < 0.5; sigma += sigmastep) 
    {
      if(expt == 2 && sigma > 0.02) break;
      for(epsilon = 0; epsilon < 1.5; epsilon += epsilonstep)
	{
	  for(mu = 0; mu <= 0.01; mu += mustep) 
	    {
	      printf("Adaptation %f %f %f\n", sigma, epsilon, mu);
	      meanh = meanhd = 0;
	      
	      for(it = 0; it < NIT; it++)
		{
		  // initialise population
		  for(i = 0; i < NPOP; i++)
		    {
		      C[i].h = 0;
		      C[i].hd = 0;
		      C[i].mu = mu;
		      C[i].sigma = sigma;
		      C[i].mumu = 0.;
		      C[i].sigmamu = 0.;
		    }

		  // initialise histogram
		  for(i = 0; i < MAXT*NHIST; i++)
		    hist[i] = 0;

		  // simulate
		  Simulate(C, outC, hist, MAXT, 1, penaltytype, epsilon, 0, 0);

		  meanh += outC[MAXT-1].h;
		  meanhd += outC[MAXT-1].hd;
		  
		  // if we're outputting distributional details, write histogram to file
		  if(expt == 1 && penaltytype == 0)
		    {
		      sprintf(str, "adaptation-%i-%i-%.4f-%i-%i-%i-hist-%.4f-%.4f-%.4f.txt", NPOP, NOFF, ALPHA, NPARAM, expt, penaltytype, sigma, epsilon, mu);
		      fp1 = fopen(str, "w");
		      for(t = 0; t < MAXT; t++)
			{
			  for(i = 0; i < NHIST; i++)
			    {
			      fprintf(fp1, "%i %i %.4f\n", t, i, hist[NHIST*t + i]);
			    }
			  fprintf(fp1, "\n");
			}
		      fclose(fp1);
		    }
		}
	      meanh /= NIT;
	      meanhd /= NIT;
	      
	      // output summary statistics
	      fprintf(fp, "%.4f %.4f %.4f %.4f %.4f\n", epsilon, mu, sigma, meanh, meanhd);
	    }
	  fprintf(fp, "\n");
	}
  
    }
  fclose(fp);

  // free up allocated memory
  free(hist);
  free(outC);
}

// simulate adaptation to new environment -- all oDNAs initially type A, then switch to environment B at t = 0
void AdaptationTime(int expt, int penaltytype)
{
  Cell *outC, C[NPOP];
  int i, t;
  double epsilon, mu, sigma;
  char str[100];
  FILE *fp, *fp1;
  int envswitch;
  double *hist;
  double sigmastep, epsilonstep, mustep;
  double adapttime, meant;
  int adaptfail;
  int it, NIT;

  // allocate memory for output
  outC = (Cell*)malloc(sizeof(Cell)*MAXT*10);
  hist = (double*)malloc(sizeof(double)*MAXT*10*NHIST);

  // decide which meta-parameters to use (which parameters to scan through in detail)
  switch(expt)
    {
    case 0: sigmastep = 0.02; epsilonstep = 0.025; mustep = 0.0002; NIT = 10; break;
    case 1: sigmastep = 0.01; epsilonstep = 0.025; mustep = 0.0033; NIT = 4; break;
    }

  // open summary file for output
  sprintf(str, "adaptationtime-%i-%i-%.4f-%i-%i-%i.txt", NPOP, NOFF, ALPHA, NPARAM, expt, penaltytype);
  fp = fopen(str, "w");

  // loop through parameter space of bottleneck strength, heteroplasmy penalty, mutation rate
  for(sigma = 0; sigma <= 0.5; sigma += sigmastep) 
    {
      if(expt == 0 && sigma > 0.02) break;
      for(epsilon = 0; epsilon < 1.5; epsilon += epsilonstep)
	{
	  for(mu = 0; mu <= 0.01; mu += mustep) 
	    {
	      printf("Adaptation %f %f %f\n", sigma, epsilon, mu);
	      meant = 0;
	      adaptfail = 0;
	      
	      for(it = 0; it < NIT; it++)
		{
		  // initialise population
		  for(i = 0; i < NPOP; i++)
		    {
		      C[i].h = 0;
		      C[i].hd = 0;
		      C[i].mu = mu;
		      C[i].sigma = sigma;
		      C[i].mumu = 0.;
		      C[i].sigmamu = 0.;
		    }

		  // initialise histogram
		  for(i = 0; i < MAXT*10*NHIST; i++)
		    hist[i] = 0;

		  // simulate
		  adapttime = Simulate(C, outC, hist, MAXT*10, 1, penaltytype, epsilon, 0, 1);
		  if(adapttime >= MAXT*10)
		    adaptfail = 1;
		  meant += adapttime;
		}
	      meant /= NIT;
	      
	      // output summary statistics
	      fprintf(fp, "%.4f %.4f %.4f %.4f\n", epsilon, mu, sigma, (adaptfail == 1 ? -1 : meant));
	    }
	  fprintf(fp, "\n");
	}
  
    }
  fclose(fp);

  // free up allocated memory
  free(hist);
  free(outC);
}

int main(int argc, char *argv[])
{
  int expt, exptparam, penaltytype;

  // process command-line argument
  if(argc != 8)
    {
      printf("Usage:\n./odna-sim.ce [experiment] [expt param] [fitness penalty] [population size] [offspring number] [oDNAs per cell] [off-target mutation frequency]\n");
      printf("  [experiment]:\n    0 = adaptation proportion\n    1 = adaptation time\n    2 = dynamic environments\n");
      printf("  [expt param]:\n    (for adaptation experiments):\n    0 = fine-grained steps\n    1 = coarse-grained steps through parameter space\n    (for dynamic environments):\n    0 = fine-grained steps\n    1 = coarse-grained steps\n    2, 3, 4 = fine-grained steps w/o mu evolution\n");
      printf("  [fitness penalty]:\n    0 = -eps, 0 < h < 1\n    1 = 4*eps*(h-0.5)^2 - eps\n    2 = -eps, h > 0.5\n    3 = -eps, h > 0.1\n");
      printf("For example (fast and simple):\n  ./odna-sim.ce 4 1 0 20 2 100 0\n");
      return 0;
    }
  else
    {
      expt = atoi(argv[1]);
      exptparam = atoi(argv[2]);
      penaltytype = atoi(argv[3]);
      NPOP = atoi(argv[4]);
      NOFF = atoi(argv[5]);
      NPARAM = atoi(argv[6]);
      ALPHA = atof(argv[7]);
    }

  // run the specified experiment
  switch(expt)
    {
    case 0: Adaptation(exptparam, penaltytype); break;
    case 1: AdaptationTime(exptparam, penaltytype); break;
    case 2: DynamicEnvironments(exptparam, penaltytype); break;
    default: printf("Didn't recognise experiment type %i\n", expt); break;
    }

  return 0;
}

