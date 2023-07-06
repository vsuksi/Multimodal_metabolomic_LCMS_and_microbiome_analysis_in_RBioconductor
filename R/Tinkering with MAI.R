# This file includes scripts for tinkering with imputation using the MAI package. The following is used after preprocessing in Notame and conversion to TreeSummarizedExperiment

# To test MAI in the Notame example workflow
merged_no_qc <- TreeSummarizedExperiment(merged_no_qc)

results_without_flagged = MAI(merged_no_qc,
          MCAR_algorithm = "random_forest",
          MNAR_algorithm= "Single",
          assay_ix = 1,
          verbose = TRUE # allows console message output
        )

metadata(results_without_flagged)[["meta_assay_1"]][["Estimated_Params"]]
