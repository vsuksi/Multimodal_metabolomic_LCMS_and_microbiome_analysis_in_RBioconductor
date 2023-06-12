# Braindump

**The braindump is a repository for the fleeting thoughts that further the project at hand but are better picked up at a later stage.**





**Does xcms interface with summarizedexperiment?**
Nope.

Skyline could do quality control. Skyline is specifically for proteomics research, tho.

Prioritize:
1. packages that interface with SummarizedExperiment
2. Bioconductor packages
3. other packages

List of Notame functionalities:
1. Peak picking (semi-automated, MS-DIAL)
2. Drift correction and flagging of low-quality features
3. Quality control
- there are nice visualizations that ought to be included

4. Imputation, transformation, normalization and scaling
- mia
5. Clustering molecular features originating from the same metabolite
- scater
6. Feature-wise (univariate) analysis
7. Multivariate analysis
8. Ranking and filtering for variable selection
9. Visualization of molecular features
10. Visualizations from uni- and multivariate analysis
11. Identification of metabolites
12. Pathway analysis
13. Biological interpretation of the results
**What criteria can you apply to make a cohesive whole? Perhaps make a an illustration of the decision process for including methods in the process? Perhaps choose a publication to base your choice of methods on? A standard?**

- Is it mentioned in OMA?



**What characteristics are important for MS data container?**
- Separate spectra are obtained from each elute (sample) from the chromatography column. A single table can then store metadata for the samples


**If using the Hintikka XO-data, Notame functionalities for multi-modal metabolomic LC/MS and microbiome analysis are of interest. What are some examples of these?  How far does one need to go in the workflow?**
The HintikkaXO dataset contains high-throughput profiling data from 40 rat samples, including 39 biomarkers, 38 metabolites (NMR), and 12706 OTUs from 318 species. It is a diet comparison study with High/Low fat diet and xylo-oligosaccaride supplementation.

- Visualizations, yes
- Time series, no
- Two groups, yes (combination of Fat and XOS factors)
- Two categorical study factors, yes (Low/high fat, 0/1 XOS diet supplement)
- Associations between molecular features and other variables, yes
