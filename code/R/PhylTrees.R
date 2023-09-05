####################################################
#### Importing the needed libraries and data #######
####################################################

## Loading the libraries:
library(ggtree)
library(treeio)
library(ggplot2)


## Navigate to the Mr.Bayes folder where the .tre output file is located:
setwd("../MrBayes/output")
## Reading the .tre file
MB_file <- read.mrbayes("gallwasps.con.tre")



#############################################################
#### Choosing the data to plot and adding information #######
#############################################################

## Convert the data to tibble to manipulate it:
MB_phylo0 <- as.phylo(MB_file)
MB_tbl <- as_tibble(MB_phylo0)


#### Add information about the population from which individuals originated ####

# First, a vector is created that has the label "outputs" at the first four positions since the
# first four individuals in MB_tbl are the out group sequences.
# The vector is set up to be as long as the MB_tbl file and the rest of the labels are "" for now.
labelNames <- c(rep("Outgroup",4),rep("",length((MB_tbl[-1:-4,4]$label)[!is.na(MB_tbl[-1:-4,4]$label)])))

# Set labels containing information about the population of origin:
for(i in 1:(length(labelNames)-4)){
  # We find the position at which the population is given in the name (between "Pop" and "W1")
  # and if the Population is smaller than 9, we set the number as the label:
  if (sub("W1.*","",sub(".*Pop","",MB_tbl[-1:-4,4]$label[!is.na(MB_tbl[-1:-4,4]$label)][i]))<9){
    labelNames[i+4] <- paste(" ",sub("W1.*","",sub(".*Pop","",MB_tbl[-1:-4,4]$label[!is.na(MB_tbl[-1:-4,4]$label)][i])),sep="")
   # We set "western" as the label for the remaining individuals:
  } else if (sub("W1.*","",sub(".*Pop","",MB_tbl[-1:-4,4]$label[!is.na(MB_tbl[-1:-4,4]$label)][i]))>8){
    labelNames[i+4] <- "western"
  } 
}
# Set the "western" label for the populations with numbers over 8  does not work in some cases,
# we set the label for the remaining ones in this step:
labelNames[!is.na(strtoi(labelNames))][strtoi(labelNames[(!is.na(strtoi(labelNames)))])>8]<- "western"

## Combine the labels with their corresponding data sets:
Pop <- data.frame(label=MB_tbl[,4]$label[!is.na(MB_tbl[,4]$label)],Pop=labelNames)
MB_phylo <- as.treedata(full_join(MB_tbl, Pop, by="label"))

## Exclude the western populations and the untested individuals from the plot:
westernPop <- MB_tbl[,4][!is.na(MB_tbl[,4])][labelNames=="western"]
untested <- "IT5Pop2"
MB_phylo_reduced <- drop.tip(MB_phylo,c(westernPop,untested))


#### Add information about the infection status ####

# We first need to convert the data back to tibble:
MB_tbl_reduced <- as_tibble(MB_phylo_reduced)

## Create a data-frame that shows the infection status of each individual:
Infec <- data.frame(Infected=sub("FALSE","0",sub("TRUE","1",grepl("W1",MB_tbl_reduced[,4]$label[!is.na(MB_tbl_reduced[,4]$label)]))))
rownames(Infec) <- MB_tbl_reduced[,4]$label[!is.na(MB_tbl_reduced[,4]$label)]




################################################################
#### Supplemental figure 4: Plotting the tree ##################
################################################################

## Plot only the tree itself:
p <- ggtree(MB_phylo_reduced,branch.length='none', layout='circular')

## Add the highlights showing which haplotype is associated with which infection status
## and the colored tips showing the original population:
p2 <- p + 
  ## Add the highlights:
  geom_hilight(node=233, fill="lightgray", alpha=.6)+
  geom_hilight(node=243, fill="darkgray", alpha=.6)+
  ## Add the colored tips and determining which population is plotted in which color:
  geom_tippoint(aes(color=Pop),size=1.5) +
  scale_colour_manual(name="Population",values=c("gray0","sienna1","red3","gray0","dodgerblue1","turquoise3","gray0","gray0","lightgray","gray","white","black")) 

## Add the bar surrounding the plot that shows the infection status:
p3 <- gheatmap(p2,Infec,offset = 0,width = 0.05,color = NULL,colnames = FALSE)+
  scale_fill_manual(name = "Infection status",
                    values = c("white","gray28"),
                    breaks = c("0", "1"),
                    labels = c("uninfected", "infected"))+
  ## Add the legend:
  theme(legend.position = "bottom",
        legend.box = "vertical", legend.margin = margin())

## Plot the final result:
p3


