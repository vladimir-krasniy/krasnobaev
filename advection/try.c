#include <math.h>
#include <stdio.h>

int main () {

/*Base numbers & conditions*/
	int N, M = 10;
	N = 10;
	double h, Cx = 1.0, k = 0.6;
	h = 2.0/N; //Piece size

	double tau;
	tau = k*h/Cx;

	int i, Mcounter = M;
	
/*Base Xes and Us*/
	double x[11]; //Malloc((N+1)*sizeof(double)) 
	for (i = 0; i < (N+1); i++) {
		x[i] =i*h - 1;
	}	


	double U[11];
	for (i = 0; i < (N+1); i++) {
		U[i] = 0;
		if ((x[i]>=(-0.5))&&(x[i]<=0.5)) {
                	U[i] = 1;
		}
        } 
		
/*Recount*/

	double Beta;
	for (i = 0; Mcounter > 0; i++) {
	
		if (i == 0) {
			Beta = (U[i] - U[N])/(x[i]-x[N]);
		}	else {
			Beta = (U[i] - U[i-1])/(x[i]-x[i-1]); 
		}

		U[i]=(x[i] - Cx*tau)*Beta + U[i] - Beta*x[i];
		printf("%f ", U[i]);
		if (i == N) {
			Mcounter--;
			i = 0;
			printf("\n");
		}
	}

//Now wo have masses of x[i] and U[i] that should be drawn
return 0;
}
