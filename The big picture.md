# The big picture

What functions are generic and which need to be modified?

Leo's comments on the introduction:
- The focus is not on integrating Notame tools; instead, the focus is on how to use some of the Notame functionalities using modern containers such as TreeSE or MAE, and investigate the pros and cons of using modern containers. These might include code complexity, performance, available methods etc.

- Notame for preprocessing -> converter into TreeSE (or example on how to make the TreeSE or other metabolomics container object from the original Notame data) -> apply Notame methods as applied in OMA or Bioconductor -> multi-modal workflow using MultiAssayExperiment

The thesis would consist of:
1. Using Notame functionalities/workflow in the TreeSE/mysterycontainer context
2. Integration of metabolomics data to bacterial abundance data with MAE
3. Analysis of the pros and cons of doing multi-modal analysis this way vs other ways
4. Reproducing some work or contributing further analysis using the new MAE workflow
