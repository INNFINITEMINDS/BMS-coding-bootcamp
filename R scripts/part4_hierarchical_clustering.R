#make a dendrogram using hierarchical clustering
cancer_dist <- as.dist(1-cancer_cor) #calculate distance matrix for clustering
cancer_clust <- hclust(cancer_dist, method="average") #hierarchical clustering
plot(cancer_clust) #take a look at our clustering
