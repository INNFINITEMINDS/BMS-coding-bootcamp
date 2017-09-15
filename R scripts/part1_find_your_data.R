#pull and parse the GEO SOFT file
source("http://bioconductor.org/biocLite.R") #start bioconductor
biocLite()
biocLite("GEOquery") #install package that parses GEO SOFT files
library(Biobase) #load packages
library(GEOquery)
cancer <- getGEO('GDS2947') #pull the SOFT file from GEO (may cause firewall alert)