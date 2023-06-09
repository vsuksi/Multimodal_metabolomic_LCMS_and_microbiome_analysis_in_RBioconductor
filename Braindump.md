# Braindump

**The braindump is a repository for the fleeting thoughts that further the project at hand but are better picked up at a later stage.**

Are networks included in orchestrating microbiome analysis?

How to scour through the multi-omic articles for relevant information, what information are you interested in?
- do they use R
- do they use Bioconductor
- what DataFrame do they use

- perhaps list these in your research plan


What characteristics are important for MS data container?

What kinds of object can multiassayexperiment store?
Classes contained in the ExperimentList must support the following list of methods:

    [:single square bracket subsetting, with a single comma. It is assumed that values before the comma subset rows, and values after the comma subset columns.
    dimnames() : corresponding to features (such as genes, proteins, etc.) and experimental samples
    dim(): returns a vector of the number of rows and number of columns


Can Msexperimentcontainer be used in multiassayexperiment? It's a dataframe

How to prioritize Notame methods? Skip preprocessing,

After peak picking was done on the LC/MS data, the peak areas were exported into a raw data matrix as a tab-separated file.

Perhaps read the multi-omics microbiome analysis articles and check which ones use Bioconductor?

Leo's comments on the introduction according to my understanding:
- The focus is not on integrating Notame tools; instead, the focus is on how to use some of the Notame functionalities using modern containers such as TreeSE or MAE, and investigate the pros and cons of using modern containers. These might include code complexity, performance, available methods etc.
- Notame for preprocessing -> converter into TreeSE (or example on how to make the TreeSE object from the original data) -> apply methods (prioritize methods from OMA)
1. Find methods, preferrably in OMA, to do some of the same things as the Notame workflow
2. Find a metabolomics container and get it to work with MultiAssayExperiment

The thesis would consist of:
1. Using Notame functionalities/workflow in the TreeSE/mysterycontainer context
2. Integration of metabolomics data to bacterial abundance data with MAE
3. Analysis of the pros and cons of doing multi-modal analysis this way vs other ways
4. Reproducing some work or contributing further analysis using the new MAE workflow

Packages of interest that interface with singlecellexperiment: scater, scran, clusterExperiment,  

# Writing paradigm
- diminishing returns in many tasks; try to do tasks a speed that gives you a sense of things moving forward, mistakes won't feel as mistakey if the effort involved was swift
- use sentences with ; for variation
- methods vs tools? Methods in non-technical parts, function in materials & methods
- object vs instance? Instance
- data structure vs data container?


If using the Hintikka XO-data, Notame functionalities for multi-modal metabolomic LC/MS and microbiome analysis are of interest. What are some examples of these?  How far does one need to go in the workflow?
- The HintikkaXO dataset contains high-throughput profiling data from 40 rat samples, including 39 biomarkers, 38 metabolites (NMR), and 12706 OTUs from 318 species. It is a diet comparison study with High/Low fat diet and xylo-oligosaccaride supplementation.

- Visualizations, yes
- Time series, no
- Two groups, yes (combination of Fat and XOS factors)
- Two categorical study factors, yes (Low/high fat, 0/1 XOS diet supplement)
- Associations between molecular features and other variables, yes
-
