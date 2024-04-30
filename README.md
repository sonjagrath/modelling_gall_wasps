# modelling_gall_wasps

This repository contains data and scripts for the manuscript:
 
> Taprogge M, Grath S. Modelling suggests Wolbachia-induced cytoplasmic incompatibility in oak gall wasps with cyclical parthenogenesis. [in revision for Journal of Evolutionary Biology, April 30, 2024]

The work that is presented in this manuscript is based on the Bachelor’s Thesis of Melanie Taprogge.
 
## Data availability

* All code is available in this github repository.
* Supplementary material for the publication is available after publishing. 
    
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

* `Dependencies`
   * The results presented in the manuscript were produced using Jupyter Notebook version 6.0.3 [^5] in Python 3.7.6 [^13].
   * The following packages are used in the python code: numpy version 1.18.1 [^2], scipy version 1.4.1 [^14], matplotlib version 3.1.3 [^3] and astropy version 4.0 [^1].

#### **`R`**

* `PhylTrees.R`
   * Contains the R code used to plot the phylogenetic tree of supplemental figure 3 based on the `gallwasps.con.tre` file created by MrBayes.
   * The file `session_info.txt` gives information on version numbers of all R packages and the platform used for the final analysis as described in the manuscript.

* `Dependencies`
   * The results presented in the manuscript were produced using RStudio version 1.4.1717 [^9] with R [^12].
   * The following libraries are used in the R code: ggtree version 3.0.2 [^17], treeio version 1.16.1 [^15] and ggplot2 version 3.3.4 [^16].

#### **`MrBayes`**

* `allFASTAaligned_complete.fas`
   * FASTA file containing manually edited and aligned sequences of all the gallwasps included in the phylogenetic analysis. Created using MegaX [^6].

* `allFASTAaligned_complete.nxs`
   *  Nexus file containing aligned sequences of all the gallwasps included in the phylogenetic analysis. Created using  ClustalX version 2.1 [^7].

* `gallwasps.nex`
   *  Nexus file containing the setup and commands used to run the phylogenetic analysis, created based on the analysis run by Ronquist and colleagues (2015) in [^8]. The commands used in the original paper can be found online (https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0123301#sec034 ) as Appendix S2.

* `output`
   * Folder containing the output of the MrBayes Analysis, including the file `gallwasps.con.tre` that was plotted using R. Note that ".trprobs" and ".t" files were omitted from github due to their large size.

* `Dependencies`
   * The results presented in the manuscript were produced using MrBayes version 3.2.1 [^4].

### **`data`**

The data we used in our analysis was published by Schuler and colleagues (2018) along with the paper [^11]. The raw data of the original publication can be downloaded at 
https://datadryad.org/stash/dataset/doi:10.5061/dryad.6k94r [^10].
The mtDNAseq data was manually edited and aligned (using MegaX [^6]), resulting in the file "allFASTAaligned_complete.fas" in the MrBayes Folder and converted to nexus format (using ClustalX version 2.1 [^7]). The resulting alignment was used to run the analysis with MrBayes and can be found in the file "allFASTAaligned_complete.nxs" in the MrBayes folder.

#### **`mtDNASeq`**

`sample_overview.xlsx`: Excel table that provides an overview of the origin, the infection status, the generation, the sex, the host plant and the sampling time of all the sequences used for our analysis. This excel spreadsheet is part of the data provided by Schuler and colleagues along with the sequencing data in [^10].


[^1]: Günther H, Lim P, Crawford S, Conseil S, Shupe D, Craig M, Dencheva N, Ginsburg A, VanderPlas J,  Bradley L. 2018 The Astropy Project: Building an Open-science Project and Status of the v2.0 Core Package. The Astronomical Journal, 156:123.
[^2]: Harris CR, Millman KJ, van der Walt SJ, Gommers R, Virtanen P, Cournapeau D, Wieser E, Taylor J, Berg, S, Smith NJ. 2020 Array programming with NumPy. Nature, 585(7825), 357-362.
[^3]: Hunter JD. 2007 Matplotlib: A 2D graphics environment. Computing in science & engineering, 9(03), 90-95. 
[^4]: Huelsenbeck, J. P., & Ronquist, F. (2001). MRBAYES: Bayesian inference of phylogenetic trees. Bioinformatics, 17(8), 754-755. https://doi.org/10.1093/bioinformatics/17.8.754
[^5]: Kluyver T, Ragan-Kelley, B, Pérez F, Granger BE, Bussonnier M, Frederic J, Kelley K, Hamrick JB, Grout, J, Corlay S. 2016 Jupyter Notebooks-a publishing format for reproducible computational workflows (Vol. 2016). 
[^6]: Kumar, S., Stecher, G., Li, M., Knyaz, C., Tamura, K. (2018). MEGA X: molecular evolutionary genetics analysis across computing platforms. Molecular Biology and Evolution, 35(6), 1547-1549. https://doi.org/10.1093/molbev/msy096
[^7]: Larkin, M. A., Blackshields, G., Brown, N. P., Chenna, R., McGettigan, P. A., McWilliam, H., Valentin, F. et al. (2007). Clustal W and Clustal X version 2.0. Bioinformatics, 23(21), 2947-2948. https://doi.org/10.1093/bioinformatics/btm404
[^8]: Ronquist, F., Nieves-Aldrey, J.-L., Buffington, M. L., Liu, Z., Liljeblad, J., Nylander, J. A. (2015). Phylogeny, evolution and classification of gall wasps: the plot thickens. PloS One, 10(5), e0123301. https://doi.org/10.1371/journal.pone.0123301
[^9]: RStudio-Team. (2021). RStudio: Integrated Development Environment for R. In RStudio http://www.rstudio.com/
[^10]: Schuler H, Egan SP, Hood GR, Busbee RW, Driscoe AL, Ott JR. 2018 Data from: Diversity and distribution of Wolbachia in relation to geography, host plant affiliation and life cycle of a heterogonic gall wasp Dryad. https://doi.org/10.5061/dryad.6k94r 
[^11]: Schuler H, Egan SP, Hood GR, Busbee RW, Driscoe AL, Ott JR. 2018. Diversity and distribution of Wolbachia in relation to geography, host plant affiliation and life cycle of a heterogonic gall wasp.
[^12]: Team RC. (2021). R: A Language and Environment for Statistical Computing. In R Foundation for Statistical Computing. https://www.R-project.org/
[^13]: Van RG, Drake F. 2009 Python 3 reference manual. Scotts Valley, CA: CreateSpace.  
[^14]: Virtanen P, Gommers R, Oliphant TE, Haberland M, Reddy T, Cournapeau D, Burovski E, Peterson P, Weckesser W, Bright J. 2020 SciPy 1.0: fundamental algorithms for scientific computing in Python. Nature methods, 17(3), 261-272. 
[^15]: Wang, L.-G., Lam, T. T.-Y, T., Xu, S., Dai, Z., Zhou, L., Feng, T., Guo, P., et al. (2020). Treeio: An R Package for Phylogenetic Tree Input and Output with Richly Annotated and Associated Data, Molecular Biology and Evolution, 37(2), 599–603. https://doi.org/10.1093/molbev/msz240
[^16]: Wickham, H. (2016). ggplot2-Elegant Graphics for Data Analysis. Springer International Publishing. Cham, Switzerland.
[^17]: Yu G., Tsan-Yuk Lam, T. , Zhu, H., Guan, Y. (2018). Two Methods for Mapping and Visualizing Associated Data on Phylogeny Using Ggtree, Molecular Biology and Evolution, 35(12), 3041–3043. https://doi.org/10.1093/molbev/msy194
