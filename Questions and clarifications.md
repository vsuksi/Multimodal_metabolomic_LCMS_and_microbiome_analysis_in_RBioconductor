# Questions and clarifications

**This is a repository for critical information regarding the project at hand. Formulating it into a question allows for a specific viewpoint to be addressed or an implication to be hinted at, for example. Include synonyms when applicable.**

**Concepts can take a while to crystallize in a seamless formulation; meanwhile, try to formulate the matter as it often means progress.**

**What are the pros and cons to NMR and LC/MS in metabolomics?**
NMR does absolute quantification and reproducibility of NMR is very high and average for LC/MS. NMR requires minimal sample preparation in comparison to LC/MS, and doesn't require tissue extraction. Sample analysis time is shorter for NMR, with the entire sample being analyzed in one measurement.

On the other hand, the number of detectable metabolites ranges from 30 to 100 for NMR, with LC/MS coming in at over one thousand. LC/MS is also 10 to 100 times more sensitive, and is better for targeted analysis.

**What is biclustering?**



**What is experimenthub?**



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
