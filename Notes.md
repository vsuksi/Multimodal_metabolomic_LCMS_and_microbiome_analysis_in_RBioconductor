

# Notes on Bioconductor
https://carpentries-incubator.github.io/bioc-project/03-installing-bioconductor.html
https://solutions.posit.co/envs-pkgs/bioconductor/

BioConductor delivers releases where a set of packages is published at once and intended for compatibility only with a certain version of R. BioConductor releases twice per year. In April a new Bioconductor release coincides with the annual release of R. Thus, in order to use the latest BioConductor April release, one needs to use the latest version of R. The October release of Bioconductor uses the same version of R, but comes with an updated set of Bioconductor packages.

# Notes on Bioconductor metabolomics packages


# Notes on "Orchestrating single-cell analysis with Bioconductor" and SingleCellExperiment documentation

Compared to bulk assays, single-cell data has to be specially handled to achieve biological insight since:
1. the number of observations (single cells) is very large
2. the increased sparsity of data due to biological fluctuations in the measurements

SingleCellExperiment is based on RangedSummarizedExperiment, a derivative of SummarizedExperiment that includes functionality for representing (genomic) ranges of interest as described by a GRanges or a GRangesList object through the rowRanges() function.

Using the SingleCellExperiment class, all data pertaining to an experiment can be stored in a single instance, facilitating the development and usage of complex analysis workflows.

The rest of the publication is rather heavily focused on scRNA-seq data analysis, and provides scant value for understanding the SingleCellExperiment class.

Functionalities include:
1. Adding low-dimensional representations
2. Convenient access to named assays
3. Adding alternative feature sets
4. Storing row (feature) or column (sample) pairings
5. Adding additional metadata fields

The SingleCellExperiment container can do most of what MultiAssayExperiment does, but without introducting an additional layer of indirection in that a MultiAssayExperiment typically functions by binding together instances of, for example, TreeSummarizedExperiment and SummarizedExperiment with shared metadata.


# Notes from "Software for the integration of multi-omics experiments in Bioconductor"

SummarizedExperiment is sufficient only to track single assays and metadata. MultiAssayExperiment was developed to address these shortcomings.

MultiAssayExperiment has three main components:
1. colData, a primary dataset containing patient or cell line-level characteristics (metadata)
2. ExperimentList, a list of results from complementary experiments
3. SampleMap, which relates ExperimentList and ColData

Key methods for manipulating a MultiAssayExperiment include:
1. A constructor function and validity check functions that simplify creation of a MultiAssayExperiment
2. Subsetting functions allowing data selection by identifiers or ranges, metadata or specific assays
3. Accessor functions that are simultaneously setters and getters


# Notes from "TreeSummarizedExperiment: a S4 class for data with hierarchical structure"

TreeSummarizedExperiment is an extension of the SingleCellExperiment class, derived from SummarizedExperiment, and is used for storing the hierarchical structure of data together with the biological profile data. Functions for  manipulating data at different resolutions are included. For example, microbial taxa are organized as a tree according to their genomic sequence. Thus, TreeSummarizedExperiment can be seen as bridging the functionalities of the phyloseq R package with the SingleCellExperiment container. TreeSummarizedExperiment is flexible in combination with R packages derived from SummarizedExperiment and the phyloseq package.

Compared to SingleCellExperiment, TreeSummarizedExperiment has five additional slots:
- rowTree: the hierarchical structure on the rows of the assays, for example hierarchy of genes or microbial taxa
- rowLinks: the link information between rows of the assays and the rowTree
- colTree: the hierarchical structure on the columns of the assays, for example hierarchy of cells or samples
- colLinks: the link information between columns of the assays and the colTree
- referenceSeq: the sequence information for rows of the assays

Note that the rowTree and colTree slots require the tree to be an object of the phylo class from the phyloseq package. Other tree formats can often be converted to a phylo object using the treeio package, for example.

Functions can be broadly divided into those that operate on the TreeSummarizedExperiment object or on the phylo objects.

In construction of the TreeSummarizedExperiment object, tree data takes precedence when provided link information (node labels) between the assay data and the tree data, so columns and rows with labels not present among the node labels of the tree are removed.

The link data objects are of the LinkDataFrame class and has five columns:
- nodeLab: the labels on the nodes of the tree
- nodeLab_alias: the alias labels of nodes on the tree
- nodeNum: the numbers of nodes on the tree
- isLeaf: whether the node is a leaf node
- whichTree: which tree the row/col is linked to

Accessor functions, like colTree(), work as setters and getters.

Subsetting can be done as usual or by nodes using subsetbyNode().

A tree can be replaced using changeTree().

Aggregation functionality with aggTSE() allows analysis of data at multiple resolutions (levels) of a tree. The colLinks or/and rowLinks are updated automatically.

There are several functions for manipulating the phylo object, including conversion of node name to number, finding descendants and ancestors at the node level and testing whether a node is a leaf node.

Custom functions can be written for TreeSummarizedExperiment objects that combine functions working on the phylo class and accessor functions.


# Notes from Notame paper

The metabolic profiling workflow involves numerous steps that require expertise in analytical chemistry, biochemistry, bioinformatics and data analysis.

The acquired data needs to undergo several preprocessing steps, starting from data collection (peak picking), where it is imperative to understand the detection threshold and signal-to-noise ratios of the measurement. This is then followed by a multi-step processing phase involving imputation, normalization, data reduction and clean-up, which determines the quality of the data that is used in downstream data-analysis, metabolite identification and biological interpretation of the results.

LC–MS-based metabolomics suffers from systematic intensity drift.


# Notes from "Orchestrating Microbiome Analysis"

The Bioconductor microbiome data science framework consists of:
- data containers, designed to organize multi-assay microbiome data
- R packages that provide dedicated methods for analyzing such data
- community of users and developers()

MultiAssayExperiment binds data structures such as TreeSummarizedExperiment and SummarizedExperiment together so they share metadata. This simplifies data manipulation tasks like subsetting. Connections between samples across different experiments are defined through a sampleMap.

Storing multiple data tables in microbiome analysis is preferrably done as follows:
- Assays are used within the data container for data transformations
- the altExp slot in TreeSE if for alternative versions of the data with the same number of samples, arising from differing taxonomic agglomeration or alternative profiling technologies, for example
- MultiAssayExperiment for multi-omic experiments, allowing for differing numbers of samples and features

Hintikka XO-data was used to study whether prebiotics would reduce the negative impact of a high-fat diet in mice. This encompassed three modalities: microbial abundance, metabolite abundance and biomarker data.

What steps were performed for the multi-assay analysis?
- Cross-correlation analysis, for elucidating the relationship between individual species of bacteria and metabolite concentrations with heatmap visualization.
- Multi-omics factor analysis, which could be seen as a generalization of PCA, for unsupervised multi-omics integration to latent space. The factor loadings (variance explained per factor and assay) was visualized with bar plots.

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