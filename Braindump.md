# Braindump

**The braindump is a repository for the fleeting thoughts that further the project at hand but are better picked up at a later stage.**

If using the Hintikka XO-data, multi-modal functionalities of Notame are of more interest. What are these?

How well do I need to understand the Notame workflow? Perhaps I need to explain the steps and why they are done, at least the ones used in my analysis?
Which steps could be relevant?
Time series?
Visualizations, yes.

Kati Hanhineva
Hintikka XO-data
Prioriteettilista Notame-työkaluista

Taxonomic microbiome

###############################################################↓
# Notes from Notame paper

The metabolic profiling workflow involves numerous steps that require expertise in analytical chemistry, biochemistry, bioinformatics and data analysis.

The acquired data needs to undergo several preprocessing steps, starting from data collection (peak picking), where it is imperative to understand the detection threshold and signal-to-noise ratios of the measurement. This is then followed by a multi-step processing phase involving imputation, normalization, data reduction and clean-up, which determines the quality of the data that is used in downstream data-analysis, metabolite identification and biological interpretation of the results.

LC–MS-based metabolomics suffers from systematic intensity drift.
###############################################################↑

###############################################################↓
# Notes from Orchestrating Microbiome Analysis

The Bioconductor microbiome data science framework consists of:
- data containers, designed to organize multi-assay microbiome data
- R packages that provide dedicated methods for analysing such data
- community of users and developers

MultiAssayExperiment binds data structures such as TreeSummarizedExperiment and SummarizedExperiment together so they share metadata. This simplifies data manipulation tasks like subsetting. Connections between samples across differennt experiments are defined through a sampleMap.

Storing multiple data tables in microbiome analysis is preferrably done as follows:
- Assays are used within the data container for data transformations
- the altExp slot in TreeSE if for alternative versions of the data with the same number of samples, arising from differing taxonomic agglomeration or alternative profiling technologies, for example
- MultiAssayExperiment for multo-omic experiments, allowing for differing numbers of samples and features

Hintikka XO-data was used to study whether prebiotics would reduce the negative impact of a high-fat diet in mice. This encompassed three modalities: microbial abundance data, metabolite concentrations and data about different biomarkers.

What steps were performed for the multi-assay analysis?
- Cross-correlation analysis, for elucidating the relationship between individual species of bacteria and metabolite concentrations. Heatmap visualization.
- Multi-omics factor analysis, which could be seen as a generalization of PCA, for unsupervised multi-omics integration to latent space. The factor loadings (variance explained per factor and assay) is visualized with bar plots.

In the framework, the following tasks can be performed:
- Data manipulation including tidying, subsetting, splitting, adding, modifying and merging
- Exploration and quality control, including abundance, prevalence and quality control
- Taxonomic-focused tasks, including assignment and access of taxonomic information, agglomeration by taxonomic rank, data transformation, and picking specific elements for analysis
- Community diversity, including estimation and visualization
- Community similarity, including explained variance, community comparisons by beta diversity analysis, other ordination methods, visualization of the most dominant genus from PCoA
- Community composition, including visualizing taxonomic composition
- Community clustering, including hierarchical clustering, K-means clustering, Dirichlet multinomial mixtures, community detection and biclustering
- Differential abundance, including differential abundance analysis, confounding variables and tree-based methods
- Machine learning, including supervised machine learning and unsupervised machine learning
- Multi-assay analyses, including cross-correlation analysis and multi-omics factor analysis
- Visualization of pre-analysis exploration, diversity estimation and statistical analyses



###############################################################↑
