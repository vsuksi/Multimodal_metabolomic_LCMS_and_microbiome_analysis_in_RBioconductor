# Converter from MetaboSet to TreeSummarizedExperiment


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
