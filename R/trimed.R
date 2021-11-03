trimed <- function(S, distanceMetric="euclidean"){
  
  if (is.function(distanceMetric)){
    calcDist <- distanceMetric
  } else if (distanceMetric=="euclidean"){
    calcDist <- function(f_i, f_S) return(sqrt(colSums((t(f_S)-f_i)^2)))
  } else if (distanceMetric=="rmsd"){
    calcDist <- function(f_i, f_S){
      sqDiffs <- (t(f_S)-f_i)^2
      return(sqrt(colSums(sqDiffs, na.rm = TRUE) / colSums(!is.na(sqDiffs))))
    }
  } else if (distanceMetric=="cor"){
    calcDist <- function(f_i, f_S) c(1-cor(matrix(f_i, ncol=1), t(f_S), use="pairwise.complete.obs"))/2
  }
  
  N <- nrow(S)            #Number of elements in set S
  l <- rep(0,N)           #Lower bound on energies for iC{1,...,N}
  m_cl <- -1              #Index of best medoid candidate so far
  E_cl <- Inf             #Energy of best medoid candidate so far
  iOrder <- sample(1:N)   #Randomize order. Could this be improved by having guess of medoid at start?

  for (i in iOrder){         
    if (l[i] < E_cl){
      d_ij <- calcDist(S[i,],S)   #Calculate dist(x(i),x(j)) for jC{1,...,N}
      l[i] <- sum(d_ij)/(N-1)     #Set l(i) to E(i)
      if (l[i] < E_cl){
        m_cl <- i
        E_cl <- l[i]
      }
      l <- pmax(l, abs(l[i]-d_ij)) #Using E(i) and dist(x(i),x(j)) to possibly improve bounds on E(j)
    }
  }
  
  return(S[m_cl,])
}
