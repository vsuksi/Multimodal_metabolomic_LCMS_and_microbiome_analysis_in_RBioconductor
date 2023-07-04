# Braindump

**The braindump is a repository for the fleeting thoughts that further the project at hand but are better picked up at a later stage.**

**Can MAI be used to confirm that no values are missing not at random?**



Results = MAI(data,
          MCAR_algorithm = "random_forest",
          MNAR_algorithm= "Single",
          assay_ix = 1,
          verbose = TRUE # allows console message output
        )

Parameters for random forest imputation


TreeSE workflow as compared to Notame and as compared to extensive scripting?


Voiko ajatella, että MS-DIAL on erottamaton osa analyysiä. Kyllä, näin edetään.

makeSummarizedExperimentFromExpressionSet <-
    function(from)
{
#     mapFun <- match.fun(mapFun)
#    rowRanges <- mapFun(from, ...)
#    matches <- match(names(rowRanges),
#                     featureNames(from),
#                     nomatch = 0)
#    from <- from[matches, drop = FALSE]
    assays <- exprs(from)
    colData <- .from_AnnotatedDataFrame_to_DataFrame(from)
    metadata <- fData(from)

    SummarizedExperiment(
        assays = assays,
        colData = colData,
        metadata = metadata
    )
}
