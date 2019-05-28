# BiocWorkshops2019 Design

A master BiocWorkshopsYYYY (where YYYY is the year of the Bioc conference) IS an R package.

- DESCRIPTION file
- _bookdown.yml


## The DESCRIPTION file

The DESCRIPTION file is just a basic R description file with the addition of the `Remotes` section. 
The remotes section should include the "remote" for each workshop package, ideally tied to an individual
`tag`, `branch`, or `commit`. [see [Remotes documentation](https://cran.r-project.org/web/packages/devtools/vignettes/dependencies.html)]

## _bookdown.yml

The `_bookdown.yml` file defines the details of the bookdown build process. In particular, the `rmd_files` 
tag describes the location of the R markdown files to be included in the book.

