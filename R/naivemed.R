naivemed <- function(S, distanceMetric="euclidean"){
  if (distanceMetric=="euclidean") dm <- as.matrix(dist(S, upper=TRUE))
  else if (distanceMetric=="rmsd") dm <- sqrt((as.matrix(dist(S, upper=TRUE))^2)/ncol(S))
  else if (distanceMetric=="cor")  dm <- (1-cor(t(S), use = "pairwise.complete.obs"))/2

  m_cl_naive <- return(S[which.min(colSums(dm)),])
}
