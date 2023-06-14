# Questions and clarifications

**This is a repository for critical information regarding the project at hand. Formulating it into a question allows for a specific viewpoint to be addressed or an implication to be hinted at, for example. Include synonyms when applicable.**

**Concepts can take a while to crystallize in a seamless formulation; meanwhile, try to formulate the matter as it often means progress.**

**Are there R packages for Quality Control?**
pMartR and protti for proteomics, massqc for metabolomics at large.

**What functionalities are present in Notame vs the only other metabolomics package in R, massqc from tidymass? Which one seems better?**
* = functionality also in the other package

Notame:
- Histograms illustrate p-values from linear regression models between each feature and
injection order
- Boxplots of feature intensities per sample*
- density plot for showing distribution of the Euclidean distances between samples
- scatterplot using t-SNE for estimating drift correction patterns, also drift pattern in the injection order*
- dendrogram for visualizing hierarchical clustering of the samples
- RSD of features from drift correction by smoothed cubic spline regression
- heatmap of the samples (correlation plot)

MassQC:
- PCA*
- RSD of features*
- boxplot for feature intensitites for each sample*
- QC sample correlation plot* (heatmap)

**Does xcms interface with SummarizedExperiment?**
Nope.

**How are missing abundance values handled in LC/MS in general and in Notame?**
Values missing due to being below an instrument’s LOD are often referred to as “missing not at random”, or MNAR.
Missing values caused by processing errors are often referred to as “missing completely at random”, or MCAR, because they are uniformly distributed across the dataset and are not missing directly due to any property of the metabolite or measurement itself.
Notame deals with MNAR and MCAR values by filtering out values that are not detected in > 50% of the samples and > 70% of QC samples. This is a heuristic method that should remove all MCARs but doesn't explicitly deal with the detection threshold and probably removes features that are barely detectable. The starting point for imputation in the Notame workflow thus involves features that are detected in over > 50% of samples, which probably removes features that are at the detection threshold of the instrument. This means that any zero values from below the detection threshold don't impact the imputation.

**Is there support for qualitative and quantitative metabolomics in the RForMassSpectrometry project?**
Data analysis approaches in metabolomics can broadly be divided into qualitative – analysis of spectral data for identification, and quantitative – analysis of individual metabolite concentrations. Notame includes methodology for both. In RForMassSpectrometry, Qfeatures and Spectra are used for quantitative and qualitative work, respectively.

**Is there support for the MetaboSet class in the RForMassSpectrometry project?**
There is no mention of MetaboSet in the RForMassSpectrometry project GitHub.

**What are metabolomics identification standards?**
The identification levels and other reporting criteria for metabolomic data processing and biological context metadata as specified by the Metabolomics Standards Initiative. There is a similar initiative for MS proteomics, for example.

**MSexperiment vs MultiAssayExperiment?**
Chromatographic data is not yet supported by MSexperiment, but is needed for assigning the metabolite identification level.

The central functionality of the QFeatures infrastructure is the aggregation of features (peptides) into higher-level features while retaining the link between the different levels. This is important for proteomics but not central for metabolomics at large.

There are several packages that interface with SummarizedExperiment that can be used with ease in the MultiAssayExperiment context

SummarizedExperiment derivatives can only be stored in the qdata slot of MSexperiment.

Argument from generalizability; MultiAssayExperiment is a more general container and can be familiar from other contexts.

**Can MultiAssayExperiment be used with Spectra and QFeatures?**
Probably not, since QFeatures is derived from MultiAssayExperiment and Spectra is built on the MsBackend class.

**In tandem mass spectrometry, is data used from the initial MS1 experiment?**
In LC-MS/MS-based untargeted metabolomics (or small compound mass spectrometry experiments in general) quantification of the compounds is performed in MS1 while the MS2 data is used for identification of the features.

**Is there a R package for clustering molecular features taking into account the retention time window?**
Yes, RamClustR. The RAMClustR algorithm is built on creating similarity scores for all pairs of features, submitting this score matrix for heirarchical clustering, and then cutting the resulting dendrogram into neat chunks using the dynamicTreeCut package - where each ‘chunk’ of the dendrogram results in a group of features likely to be derived from a single compound.

**Should batch correction be implemented? What is batch correction in the context of LC-MS?**
Notame is for single-batch experiments, so batch correction is not included in the workflow, although there is a deprecated .R script for batch correction in the Notame package. Methods include  Removal of Unwanted Variation (RUV) and batchCorr. batchCorr is in a developmental phase but is available through the author Carl Brunius. the hierarchical hRUV approach quantifies variance within and between batches uses these replicates to remove unwanted variation in a hierarchical manner.

**Is there a converter between MetaboSet and TreeSummarizedExperiment?**
Not directly. Metaboset is an ExpressionSet derivative so makeSummarizedExperimentFromExpressionSet() from the SummarizedExperiment package can be used as a converter template meibi?

**Where does microbiome analysis start in OMA?**
After processing Illumina-sequenced paired-end fastq files that have been split (or “demultiplexed”) by sample. The resulting amplicon sequence variant (ASV) table is a higher-resolution analogue of the traditional OTU table, which records the number of times each exact amplicon sequence variant was observed in each sample.

**What constitutes the MSexperiment container?**
- the sampleData slot for a DataFrame, with each row describing a sample with columns containing all relevant information on that sample
- files for data or annotations stored in the experimentFiles slot
- general metadata, such as the commands used to generate the mzid files, is stored in the metadata slot
- Spectra data in a Spectra object, created from data from the experimentFiles slot, is stored in the spectra slot
- A Spectra object consists of msLevel, rtime, m/z and intensity
- Quantification data is stored as a QFeatures object or SummarizedExperiment object in the qdata slot
- any additional data, such as peptide-spectrum matches can be added to the list in the otherData slot

**What is collision-induced dissociation?**
A technique for ion fragmentation used in MS/MS

**What does aggregating features in QFeatures mean? Is it a targeted or non-targeted approach?**
aggregateFeatures in Qfeatures aggregates peptide to spectrum matches (PSMs) into peptides and further into proteins. This is after matching the spectra to peptides from a database in an untargeted workflow. This is not of much use in metabolomics at large, but valuable for proteomics. There is no clustering function.

**What R packages are available for metabolite identification?**
There are four R packages for metabolite identification; metID, xcms, MAIT and MetaboList 2.

**Are metabolic profiling and metabolite identification synonyms?**
In most use cases, yes, although metabolic profiling refers more to the process itself

**How is QFeatures different from MultiAssayExperiment?**
QFeatures is derived from the MultiAssayExperiment
The QFeatures class extends the inherits all functionalities.  QFeatures can be conceptualized as an evolving MSnSet (derived from eSet, mimicking ExpressionSet) data towards SummarizedExperiment, but for MS data.

MSnSet objects can be coerced to/from ExpressionSet and SummarizedExperiment objects. In the latter case, the metadata available in the protocolData, experimentData are completely dropped, and only the logging information of the processingData slot is retained. All these metadata can be subsequently be added using the addMSnSetMetadata (see examples below). When converting a SummarizedExperiment to an MSnSet, the respective metadata slots will be populated if available in the SummarizedExperiment metadata.

**Are labeled and targeted synonyms in the context of MS?**
Not necessarily, labeled can also refer to isobaric labeling for proteins or peptides

**What does mslevel in Spectra refer to?**
Identification level according to Metabolomics Standards Initiative.

**How is meta-data handled in the multi-omics articles?**
In a separate table in a list of tables. In short, everything is kept in separate tables and accessed by extensive scripting.

**What are the main takeaways regarding data infrastructure from scouring multi-omics articles?**
- do they use R? - all of them use R
- do they use Bioconductor? - none of them use BioConductor
- what data structure do they use? - no data infrastructure used, only dataframes
- do the articles use a data container - they don't


**What kinds of object can MultiAssayExperiment store?**
Classes contained in the ExperimentList must support the following list of methods:
- [:single square bracket subsetting, with a single comma. It is assumed that values before the comma subset rows, and values after the comma subset columns.
- dimnames() : corresponding to features (such as genes, proteins, etc.) and experimental samples dim(): returns a vector of the number of rows and number of columns

**What packages interface with SingleCellExperiment?**
scater, scran and clusterExperiment.

**Can an MSexperiment object be converted to a SummarizedExperiment object?**
eSet to SummarizedExperiment data converter might do it for MSexperiment. MSexperiment is perhaps more similar to MultiAssayExperiment, as a SummarizedExperiment object can be included in the qdata slot. Based on the latter observation, conversion to SummarizedExperiment seems far-fetched.

**Is quantification of interest in the work at hand?**
Notame doesn't mention quantification.

**Why is there a separate slot for quantification data in the MSexperiment container?**
Quantification of MS data is complicated; peak areas are not directly reflective of metabolite quantities because of differential ionization efficiencies of the different metabolites within a complex mixture.


**Can SummarizedExperiment can be included in the MSexperiment container?**
Yes, but only in the qdata slot for quantification data.

**What base and Bioconductor classes work as elements of a MultiAssayExperiment ExperimentList? Will MSexperiment class work in ExperimentList**
Base::matrix, Base:ExpressionSet, SummarizedExperiment, RangedSummarizedExperiment and RaggedExperiment are known to work as elements of ExperimentList. MSexperiment might work but probably not as it is more like the MultiAssayExperiment container. MSexperiment is used for storing the whole experiment in the RForMassSpectrometry framework; Spectra and Qfeatures objects are stored in the MSexperiment object are used for the spectra and abundances, respectively.

**Should I include networks in the workflow?**
Leo doesn't seem to have done much work on network metabolomics. Then again, Notame includes networks.

**Is MSnbase or MSexperiment best used for the work at hand?**
MSexperiment, since it builds on MSnbase via Spectra. It is a more abstracted data container built based on Biobase eSet.

**MSnbase vs MSexperiment vs Spectra? They have the same authors.**
- The MsExperiment aims at being very light-weight and flexible to accommodate all possible types of MS experiments (proteomics, metabolomics, …) and all types of MS data representations (chromatographic and spectral data, quantified features etc). In addition, it allows to bundle additional files and data, such as annotations, within the object.
- The MsExperiment package provides light-weight and flexible containers for MS experiments building on the new MS infrastructure provided by the Spectra package
- MSnbase is primarily for proteomics MS experiments using isobaric labeling
- Spectra is an extension of the of in-memory and on-disk data representations from the MSnbase package (that's why MSnbase isn't included in the RForMassSpectroMetry initiative package list)
- Spectra provides a scalable and flexible infrastructure to represent, retrieve and handle mass spectrometry (MS) data.
- MetaboAnnotation, for less experienced users, builds on the spectra package and provides functions for annotation of LC-MS and LC-MS/MS data. MetaboAnnotation supports SummarizedExperiment
- MSnbase -> Spectra -> MsExperiment (to be taken with a grain of salt



**What does "performing annotation" mean in "A modular and expandable ecosystem for metabolomics data annotation in R"?**
-  LC-MS instrumentation and analysis conditions can differ substantially among laboratories and experiments, thus resulting in non-standardized datasets demanding customized annotation workflows
- annotation includes counting elements in chemical formulas, converting element counts to chemical formulas, removing elements from chemical formulas, adding elements to chemical formulas, standardizing formulas according to Hill notation, calculating mass from formulas, converting between masses and m/z values, grouping of isotopologue peaks, matching numerical values accepting differences, calculating a normalized dot product, calculating a normalized Euclidian distance, calculating normalized absolute values distance and calculating normalized spectra angle

**What is the motivation for Notame?**
- Starting from the acquisition of data to the identification of metabolites, the metabolic profiling workflow involves numerous steps that require expertise in analytical chemistry, biochemistry, bioinformatics and data analysis—click-and-go online tools may therefore not provide
adequate flexibility.
- no further motivation is provided, but it is included as a protocol in the Metabolites journal so it is justified to base your metabolomics understanding on it, even if Notame focuses mainly on food and nutritional approaches

**Identification vs annotation of metabolomics data?**
Identification is a central part of metabolomics data annotation, which includes other tasks.

**What is host trait information in microbiome research?**
Any information pertaining to the subjects (hosts) biological functioning, for example body mass index; in other words, any information that is not from bacteria.

**What is unit testing?**
Formal automated testing of functions. An expectation is the atom of testing, a test groups together multiple expectations to test output from a single function and a file groups together multiple related tests.

**What is ExpressionSet and its significance?**
ExpressionSet (historical) is generally used for array-based experiments and gene expression data and can only store one count matrix per object. SummarizedExperiment is an extension of the ExpressionSet class include multiple assays of the same dimensions in a single object. eSet is the new ExpressionSet data structure for high-throughput experiments

**What is a virtual class in R?**
A class for which no actual object can be created; the most common form of which is the class union, a virtual class that includes member classes. Methods that are written with the class union are eligible for use with object from any of the member classes. Virtual classes are also referred to as abstract classes.

**What are the pros and cons to NMR and LC/MS in metabolomics?**
NMR does absolute quantification and reproducibility of NMR is very high and average for LC/MS. NMR requires minimal sample preparation in comparison to LC/MS, and doesn't require tissue extraction. Sample analysis time is shorter for NMR, with the entire sample being analyzed in one measurement.

On the other hand, the number of detectable metabolites ranges from 30 to 100 for NMR, with LC/MS coming in at over one thousand. LC/MS is also 10 to 100 times more sensitive, and is better for targeted analysis.

**What is biclustering?**
Given a matrix of values, a biclustering algorithm generates a subset of rows that exhibit similar behavior across a subset of columns, or vice versa.


**What is ExperimentHub?**
ExperimentHub is a central location for curated data from experiments, publications or training courses. Each resource has associated metadata, tags and date of modification.


**What is an operational taxonomic unit (OTU)?**
An OTU is an operational definition of groups in a dataset based on some similarity threshold. In the context of microbiomics, OTU's are introduced as subgroups to taxonomic class as follows: Kingdom - Phylum - Class - OTU.

**How is redundant representation of the same metabolite due to unpredictable adduct behavior and neutral loss formation avoided**
Features are clustered and combined anew based on correlated feature pairs using a specified retention time window and correlation threshold. After this, the dataset is ready for analysis.

**How are low-quality features identified and possibly removed?**
Molecular features with a relative standard deviation of < 0.2 and D-ratio of < 0.4 should be retained. The D-ratio compares the standard deviation of the QC samples to relative to the standard deviation of the samples for each feature.

Another approach is to fit linear models to each feature as if they were predicted by the injection order, which is random. The p-values for the regression coefficients for each feature are plotted as a histogram, and compared to a horizontal line representing the expected uniform distribution.

A box plot featuring the distribution of all feature levels in a sample is made to identify systematic changes in the global feature levels across samples. In a second box plot, the samples are in injection order, in order to visualize systemic drift.

Density plots for the distribution of biological samples and QC samples is used to visualize the overlap, indicating poor data quality. Such plots can be generated before and after drift correction and quality control; ideally, the distributions will no longer overlap.

PCA or t-SNE plots are generated to  observe trends in the data with regards to injection order as visualized by a color grading the points. The samples should be randomly scattered with regards to injection order, with the QC samples grouped together. Other trends of interest include treatment groups and time points.

Hierarchical clustering is applied to the samples, and the QC samples are expected to be clustered together tightly.


**How is drift correction performed?**
Drift is not necessarily linear, so drift correction is performed by fitting a smoothed cubic spline to the QC samples. The sole smoothing parameter controls the curvature of the drift function and prevents overfitting to the QC samples. The smoothing parameter value is chosen by leave-one-out cross validation. The abundance values are then corrected based on the drift function.

**What is tandem mass spectrometry and its use case in this context?**
The first mass spectrometry run is as usual. Before the second run, select analytes are split into smaller fragment ions and analyzed in the second mass spectrometer run. The fragmentation step allows for identification of ions that have very similar m/z-ratios in regular mass spectrometry.

**What is a quality control (QC) sample in untargeted metabolomics?**
A small aliquot of each sample is mixed together and used as quality control. QC samples are injected at regular intervals in the mass spectrometry analysis to identify and remove drift. Some molecular features cause too much variation in QC intensities even after drift correction.

**What is prevalence in microbiome analysis?**
Prevalence refers to quantification of the frequency of samples where certain microbes are detected. Prevalence is reported as sample size (n) or percentage (unit interval).
