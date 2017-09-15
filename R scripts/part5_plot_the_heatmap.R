#put the dendrogram on a heatmap
cancer_dend <- as.dendrogram(cancer_clust) #save the clusters to a format we can plot later
heatmap(cancer_norm[1:20,], Rowv=NA, Colv=cancer_dend, labRow=NA, labCol=NA) #plot a heatmap
library(RColorBrewer)
display.brewer.all()
heatmap(cancer_norm[1:20,], Rowv=NA, Colv=cancer_dend, labRow=NA, labCol=NA, col=brewer.pal(9,'Oranges')) #make the colormap better