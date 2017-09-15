#check out the object and extract the expression data as normalized numbers
str(cancer)
Meta(cancer)$sample_type #check out individual parts of the metadata
Meta(cancer)$sample_count
Meta(cancer)$description[1]

Table(cancer)[1:10,1:10]

cancer_trim <- Table(cancer)[,3:ncol(Table(cancer))] #cut out the text
typeof(cancer_trim[1,1]) #is the data what we think it is?
cancer_expr_data <- sapply(cancer_trim, as.numeric) #convert to numbers
cancer_norm <- cancer_expr_data/rowMeans(cancer_expr_data) #normalize expression