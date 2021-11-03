# fastMedoids
(Faster) medoid calculation in R for different distance metrics

##  Authors
Jasper Van doninck

##  Collaborators
Chakata Hart

##  Currently implemented algorithms
### Naive medoids
Based on distance matrices, requiring O(N<sup>2</sup>) distance calculations.

### trimed 
Exact calculation of the medoid using the triangle inequality to cut down the search space (Newling and Fleuret, 2017).

##  Currently implemented distance metrics
### Euclidean distance
Euclidean distance between two vectors: *sqrt(sum((x(i)-x(j))<sup>2</sup>))*  
Missing values are not supported.

### Root Mean Square Distance (RMSD)
Root Mean Square Distance between two vectors: *sqrt(sum((x(i)-x(j))<sup>2</sup>)/N)*  
N is adjusted for missing values in x(i) and/or x(j).

### Correlation
Half of the complement of the Pearson correlation between two vectors: *(1-cor(x(i), x(j)))/2*  
The resulting distance metric will be between 0 (perfect positive correlation) and 1 (perfect negative correlation). Missing observations are ignored.

##  References:
Newling, J. & Fleuret, F. (2017) **A sub-quadratic exact medoid algorithm**, Proceedings of the 20th International Conference on Artificial Intelligence and Statistics (AISTATS), PMLR 54:185-193, 2017
