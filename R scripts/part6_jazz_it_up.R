#jazz it up
color.map <- function(disease_state) { if (disease_state=="adenoma") 'red' else 'blue' }
group_colors <- unlist(lapply(Columns(cancer)$disease.state, color.map)) #assign a color based on sample type
heatmap(cancer_norm[1:20,], Rowv=NA, Colv=cancer_dend, labRow=NA, labCol=NA, ylab="Probes", col=brewer.pal(9,'Oranges'), margins=c(5,2), main="", ColSideColors=group_colors)
mtext("Samples", side=1, line=2)
mtext("Fig 1. mRNA expression in colorectal mucosal & adenoma tissue", side=1, line=4) #improve margin spacing, add labels