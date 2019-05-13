# Testing your Bioconductor Workshop on Travis CI

Please refer to this website for detailed instructions on setting up Travis to
build your Bioconductor Workshop chapter:
https://bookdown.org/yihui/bookdown/github.html

## GitHub Personal Access Token

In order to set up Travis, you will need a GitHub PAT.
You can generate one via the `usethis` package:

```r
library(usethis)

## Check to see if a PAT exists already:
github_token()

## If it doesn't, run this and follow instructions:
browse_github_token()
```

You will then need to save the environment variable via Travis in your
repository's settings by going to the Travis CI website page for your
project.

## Creating a `gh-pages` branch

To build your chapter, you will need to create a GitHub Pages branch.
You can use the following commands to `checkout` the branch and to clear
the current directory in the branch:

```
git checkout --orphan gh-pages
git rm -rf .
```

Then commit the branch to GitHub:

```
git commit -m "Initial commit"
git push origin gh-pages
```

## Files to include in your repository

To build your book / chapter, you will need a few files:

* `.travis.yml`
* `_build.sh`
* `_deploy.sh`

See the templates in the `BiocWorkshops2019` folder.

_Note_. A `DESCRIPTION` file with your dependencies listed is also required.

