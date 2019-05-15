# Testing your Bioconductor Workshop on Travis CI

Please refer to this website for detailed instructions on setting up Travis to
build your Bioconductor Workshop chapter:
https://bookdown.org/yihui/bookdown/github.html

Be sure to enable Travis for your *fork* of the workshops repository by going
to: https://www.travis-ci.org/account/repositories and moving the slider to the
right.

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

# create a hidden file .nojekyll
touch .nojekyll
git add .nojekyll
```

Then commit the branch to GitHub:

```
git commit -m "Initial commit"
git push origin gh-pages
```

## Files to include in your repository

To build your book / chapter, you will need a few files:

* `_bookdown.yml`
* `.travis.yml`
* `_build.sh`
* `_deploy.sh`
* `DESCRIPTION`

See the templates in the `BiocWorkshops2019` folder.

