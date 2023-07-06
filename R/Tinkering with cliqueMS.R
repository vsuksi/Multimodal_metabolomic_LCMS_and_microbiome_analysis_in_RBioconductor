# This file includes scripts for tinkering with cliqueMS, which doesn't seem to be applicable for clustering taking into account retention time because of too tight compatibilty with xcms.

library(cliqueMS)
library(readxl)
library(xcms)

data_read <- read_excel("Test.xlsx")

# Rename columns and create xcmsSet
## The groups slot in the xcmsSet can not be populated without grouping the features using xcms
names(read_data)[2] <- "rt"
names(read_data[3] <- "mz"
names(read_data)[4:14] <- "sample"
data <- new("xcmsSet", peaks=as.matrix(read_data))

# Create an anClique instance of the data
ex.anClique <- createanClique(data)

# Create cliques, that is features grouped by a similarity network
set.seed(2)
ex.cliqueGroups <- getCliques(data, filter = TRUE)
