# BiocWorkshops2019 Design

A master BiocWorkshopsYYYY (where YYYY is the year of the Bioc conference) IS an R package.

- DESCRIPTION file
- _bookdown.yml

It also contains a `workshops` directory. 

## The DESCRIPTION file

The DESCRIPTION file is just a basic R description file with the addition of the `Remotes` section. 
The remotes section should include the "remote" for each workshop package, ideally tied to an individual
`tag`, `branch`, or `commit`. [see [Remotes documentation](https://cran.r-project.org/web/packages/devtools/vignettes/dependencies.html)]

## _bookdown.yml

The `_bookdown.yml` file defines the details of the bookdown build process. In particular, the `rmd_files` 
tag describes the location of the R markdown files to be included in the book.

## `workshops` directory

The workshops directory contains git submodules for each of the workshop packages. 

# working with submodules

See [git submodules documentation](https://git-scm.com/book/en/v2/Git-Tools-Submodules) as a starter.

## Adding submodule

```
git submodule add https://github.com/seandavi/GEOquery.git workshops/GEOquery
git add .gitmodules workshops/GEOquery
git commit -m 'add GEOquery submodule'
```

## Updating code in the submodule

```
git submodule update workshops/GEOquery
```



