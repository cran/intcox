#include "stdio.h"				
								
int max(int a, int b)			
{								
	return (a > b ? a : b);		
}								
								
void pavaC(double* w, double* y, int* n, int* index, double* weight, double* ghat)	
{								
								
	double nw;					
	int ci, j, nn;				
nn=*n-1;						
								
ci=0;							
index[ci]=0;					
weight[ci]=w[0];				
ghat[ci]=y[0];					
								
for (j=1; j<=nn; j++)			
{	ci=ci+1;					
	index[ci]=j;				
	weight[ci]=w[j];			
	ghat[ci]=y[j];				
	while (ci>=1 && ghat[max(ci-1,0)]>=ghat[ci])	
	{	nw=weight[ci-1]+weight[ci];					
		ghat[ci-1]=ghat[ci-1]+(weight[ci]/nw)*(ghat[ci]-ghat[ci-1]);	
		weight[ci-1]=nw;		
		ci=ci-1;				
	}							
}								
while (nn>=0)					
{	for (j=index[ci]; j<=nn; j++)	
	{	ghat[j]=ghat[ci];			
	}								
	nn=index[ci]-1;					
	ci=ci-1;						
}									
}									


