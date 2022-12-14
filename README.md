# modelling_gall_wasps

This repository contains data and scripts for the manuscript:
 
> Taprogge M, Grath S. Modelling Wolbachia-induced cytoplasmic incompatibility in oak gallwasps with cyclical parthenogenesis. [submitted]
 
## Data availability

* All code is available in this github repository.
* Supplementary material for the publication is available after publishing. <!-- still to be done --> 
    
## Directory structure

### **`code`**

The R and Python scripts should be run from the directory they are in. Output will be stored in created subfolders as the code is run. 

#### **`Python`**

* `DemonstrationOfTheModel.ipynb`
   * Demonstrates the model equations and plots the spread of Wolbachia and the infection associated mtDNA depending on the chosen parameters.
   * Supplemental figures 1 and 2 are plotted here. <!-- [figure numbers are updated]-->

* `TestingForMinimumCI.ipynb`
    * Contains the calculation of the confidence intervals, the calculation of the minimum level of CI based on maternal transmission measurements (first approach) and the comparison of the data with model predictions (second approach).
    * Figures 2 and 3 are plotted here. <!-- [figure numbers are updated]-->

#### **`R`**

* `PhylTrees.R`
* Contains the R code used to plot the phylogenetic tree of supplemental figure 3 based on the `gallwasps.con.tre` file created by MrBayes.
* The file `session_info.txt` gives information on version numbers of all R packages and the platform used for the final analysis as described in the manuscript.

### **`data`**

The data we used in our analysis and was published by Schuler and colleagues (2018) along with the paper “Diversity and distribution of Wolbachia in relation to geography, host plant affiliation and life cycle of a heterogonic gall wasp”. The raw data can also be downloaded at 
https://datadryad.org/stash/dataset/doi:10.5061/dryad.6k94r

#### **`mtDNASeq`**

`sample_overview.xlsx`: Excel table that provides an overview of the origin, the infection status, the generation, the sex,
the host plant and the sampling time of all the sequences used for our analysis.
