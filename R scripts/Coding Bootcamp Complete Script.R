#pull and parse the GEO SOFT file
source("http://bioconductor.org/biocLite.R") #start bioconductor
biocLite()
biocLite("GEOquery") #install package that parses GEO SOFT files
library(Biobase) #load packages
library(GEOquery)
cancer <- getGEO('GDS2947') #pull the SOFT file from GEO (may cause firewall alert)

#check out the object and extract the expression data as normalized numbers
str(cancer) #print the structure of the object
Meta(cancer)$sample_type #check out individual parts of the metadata
Meta(cancer)$sample_count
Meta(cancer)$description[1]
Table(cancer)[1:10,1:10] #check out some of the data
cancer_trim <- Table(cancer)[,3:ncol(Table(cancer))] #cut out the text
typeof(cancer_trim[1,1]) #is the data what we think it is?
cancer_expr_data <- sapply(cancer_trim, as.numeric) #convert to numbers
cancer_norm <- cancer_expr_data/rowMeans(cancer_expr_data) #normalize expression

#make a dendrogram using hierarhical clustering
cancer_cor <- cor(cancer_norm, method="pearson") #create similarity matrix of correlations
head(cancer_cor)
cancer_dist <- as.dist(1-cancer_cor) #calculate distance matrix for clustering
cancer_clust <- hclust(cancer_dist, method="average") #hierarchical clustering
plot(cancer_clust) #take a look at our clustering

#put the dendrogram on a heatmap
cancer_dend <- as.dendrogram(cancer_clust) #save the clusters to a format we can plot later
heatmap(cancer_norm[1:20,], Rowv=NA, Colv=cancer_dend, labRow=NA, labCol=NA) #plot a heatmap
library(RColorBrewer)
display.brewer.all()
heatmap(cancer_norm[1:20,], Rowv=NA, Colv=cancer_dend, labRow=NA, labCol=NA, col=brewer.pal(9,'Oranges')) #make the colormap better

#jazz it up
color.map <- function(disease_state) { if (disease_state=="adenoma") 'red' else 'blue' }
group_colors <- unlist(lapply(Columns(cancer)$disease.state, color.map)) #assign a color based on sample type
heatmap(cancer_norm[1:20,], Rowv=NA, Colv=cancer_dend, labRow=NA, labCol=NA, ylab="Probes", col=brewer.pal(9,'Oranges'), margins=c(5,2), main="", ColSideColors=group_colors)
mtext("Samples", side=1, line=2)
mtext("Fig 1. mRNA expression in colorectal mucosal & adenoma tissue", side=1, line=4) #improve margin spacing, add labels
