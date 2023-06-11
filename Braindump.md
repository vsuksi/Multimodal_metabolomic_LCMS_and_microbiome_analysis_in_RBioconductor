# Braindump

**The braindump is a repository for the fleeting thoughts that further the project at hand but are better picked up at a later stage.**


Make a list of Notame tools including yay or nay and implementation.

Suggest a priority list for Leo with basic information:
1.

Use the same database as notame for identification?

**What are metabolomics identification standards?**
The identification levels and other reporting criteria for metabolomic data processing and biological context metadata as specified by the Metabolomics Standards Initiative. There is a similar initiative for MS proteomics, for example.

Quantitative = abundance
Qualitative = identification

Data analysis approaches in metabolomics can broadly be divided into qualitative – analysis of spectral data and quantitative – analysis of individual metabolite concentrations. Notame includes methodology for both. In RForMassSpectrometry, Qfeatures and are used for quantitative and qualitative work, respectively.

In both Notame and Spectra,

**What criteria can you apply to make a cohesive whole? Perhaps make a an illustration of the decision process for including methods in the process? Perhaps choose a publication to base your choice of methods on? A standard?**

- Is it mentioned in OMA?

The MSexperiment is populated by importing MS data files as a Spectra object  and sample annotations as a DataFrame.

A Spectra object consists of msLevel, rtime, m/z and intensity



**What characteristics are important for MS data container?**
- Separate spectra are obtained from each elute (sample) from the chromatography column. A single table can then store metadata for the samples

**If using the Hintikka XO-data, Notame functionalities for multi-modal metabolomic LC/MS and microbiome analysis are of interest. What are some examples of these?  How far does one need to go in the workflow?**
The HintikkaXO dataset contains high-throughput profiling data from 40 rat samples, including 39 biomarkers, 38 metabolites (NMR), and 12706 OTUs from 318 species. It is a diet comparison study with High/Low fat diet and xylo-oligosaccaride supplementation.

- Visualizations, yes
- Time series, no
- Two groups, yes (combination of Fat and XOS factors)
- Two categorical study factors, yes (Low/high fat, 0/1 XOS diet supplement)
- Associations between molecular features and other variables, yes
