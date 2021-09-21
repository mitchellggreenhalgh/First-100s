
# Make newTable of 105 of each individual row ####

# Read in data
table_a <- read.csv("diamondFork/metadataColumns4_1a.csv",
                    header = FALSE)

# New table and dummy table/variables
newTable <- NULL 
tempDF1 <- data.frame(v1 = character(0),  # Empty dataframe with 6 variables
                      v2 = character(0),
                      v3 = character(0),
                      v4 = character(0),
                      v5 = character(0),
                      v6 = character(0))

# Create newTable
for (i in 1:nrow(table_a)) {  # i = each unique row
  for(j in 1:105){  # j = repeat it 105 times
    tempDF1[j,] <- table_a[i,]
  }
  newTable <- rbind(newTable, tempDF1)  # combine each tempDF of 105 iterations of each row to itself
}


# Make Taxa Vector to attach to newTable ####

# Read in data
taxa <- read.csv("diamondFork/taxa.csv",
                 header = FALSE)

newTaxa <- NULL
#tempDF2 <- data.frame(v1 = character(0))

for (k in 1:26) {  # k = number of sites remaining (will be total sites in table b)
  newTaxa <- rbind(newTaxa, taxa)
}

# Make new data fram where the Taxa are separated after the first space into two columns
newTaxa2 <- reshape2::colsplit(as.vector(newTaxa[,1]), " ", c("orderHigher", "famGenSpe"))


# Combine newTaxa to newTable
newTable2 <- cbind(newTable, newTaxa2)


# Take each column of values and make them all one column ####

# Read in data
values <- read.csv("diamondFork/table4_1a_values.csv",
                   header = FALSE)

# Make newValues (turn columns into one column)
newValues <- NULL

for (l in 1:26) {  # l = number of columns/sites to append to each other
  newValues <- append(newValues, values[,l])
}

# cbind everything
newTable3 <- cbind(newTable2, newValues)

# Export newTable3 ####

write.csv(newTable3,
          "diamondFork/newTable4_1a.csv",
          row.names = FALSE,
          col.names = FALSE)
