'Docopt example

Usage: 
    exscrDoc.R --counts <file>... --phenodata <file> --factor <string> [--control <string>...]
    
Options:
    
    --counts <file>     Gene counts, one file per sample.
    --phenodata <file>  Phenotype data in CSV format.
    --factor <string>   Covariate of interest.
    --control <string>  Optional parameters representing names of potential 
                        confounders To be included in the design formula. 
                        Must correspond to column names in the pheno data CSV.
' -> doc

Sys.getenv("R_LIBS_USER")
##userlib <- path.expand(Sys.getenv("R_LIBS_USER"))
userhome <- paste("/home/",system ("whoami",intern=TRUE),sep="")
userlib <- sub("~", userhome, Sys.getenv("R_LIBS_USER"))
userlib
.libPaths(userlib)
.libPaths()
library(docopt)
opts <- docopt(doc)

library(DESeq2)
library(pasilla)
library(ReportingTools)

directory <- ""

sampleFiles <- opts$counts
phenoCSV = read.csv(opts$phenodata)


designFormula <- paste0("~",paste(c(opts$control, opts$factor), collapse = '+'))

sampleTable <- data.frame(fileName = basename(sampleFiles), 
                          filePath = sampleFiles, 
                          stringsAsFactors = FALSE)

ind <- match(phenoCSV[,1], tools::file_path_sans_ext(sampleTable$fileName))
sampleTable <- sampleTable[ind, , drop = FALSE]
sampleTable <- cbind(sampleTable, phenoCSV)
sampleTable <- sampleTable[complete.cases(sampleTable),]

dds <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                  directory = directory,
                                  design =  as.formula(designFormula))

dds <- DESeq(dds)

des2Report <- HTMLReport(shortName = 'DESeq2_analysis',
                         title = 'DESeq2 DE analysis on pasilla data',
                         reportDirectory = "./reports")

publish(dds, des2Report, pvalueCutoff = 0.05,
        factor = colData(dds)[,opts$factor],
        reportDir="./reports")

finish(des2Report)
