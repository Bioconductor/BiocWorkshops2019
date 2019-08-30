
This repository contains details of the build process and usage for materials
from the [Bioc2019 conference].

[Bioc2019 conference]: https://bioc2019.bioconductor.org

# Compiled Workshops Link

https://rebrand.ly/biocworkshops2019

# Running workshop materials locally

The workshops (except the CWL workshop) are all installed and
ready-to-run inside [docker]; you will need to *install docker* on your machine to
follow along. We have a base docker image [seandavi/bioc_2019] that contains
the operating system and base R installation. The workshops and additional package (over 600)
are included as a separate download that can be mounted into the container
as a `volume`. To use the entire set of workshop materials, do:

- Make a directory for the installed packages:

    ```
    mkdir /home/ubuntu/bioc-libs # or another convenient directory with about 20GB of free space
    ```

- Download and untar entire tar.gz file with all installed packages and materials:

    ```
    cd /home/ubuntu/bioc-libs # use the directory from above
    wget https://s3.amazonaws.com/biocbuild.cancerdatasci.org/bioc2019-usr-local.tar.gz
    tar -xzf bioc2019-usr-local.tar.gz
    ```

- Run docker locally with (you may or may not need `sudo` depending on your docker setup):

    ```
    # again, use the directory from above
    sudo docker run --name bioc_2019 -d -v /home/ubuntu/bioc-libs:/usr/local/lib/R/site-library \
        -p 80:8787 -e PASSWORD=bioc seandavi/bioc_2019
    ```

- Credentials:
  - username: 'rstudio'
  - password: 'as you set it--bioc above'

[docker]: https://docker.io
[seandavi/bioc_2019]: https://cloud.docker.com/u/seandavi/repository/docker/seandavi/bioc_2019


# Instructions For Workshop Authors

## Getting started

To contribute a new workshop, open a [BiocWorkshops issue][] starting with
the `[Workshop]` keyword in the title of the issue. Provide a link to the
repository in the issue message body. You may also include GitHub usernames
of workshop collaborators. For a successful workshop build, adhere to the
following:

1. Package your workshop as an R package. The example package https://github.com/lpantano/dummychapter1 demonstrates all key elements of how your package must be prepared, and also provides an example `.travis.yml` for Continuous Integration against bioc-devel.
2. Include a standard vignette in the vignettes directory
3. Put any extra files (images, .bib) in `inst/vignettes` and reference them
in the vignette using `system.file`
4. Number **3** requires package chapter installation before vignette build or
`build_vignettes=TRUE` when building the package.
5. Use only one top-level section (`#`), for the title of your workshop. All other sections must be second-level (`##`) or lower. You may find the [usage section of the Bookdown documentation](https://bookdown.org/yihui/bookdown/usage.html) helpful for background.
6. Do not use `BiocStyle` functionality. The style will be based on bookdown/gitbook.

### DESCRIPTION

Update the DESCRIPTION file adding packages utilized in your workshop to
the **Imports** field.

### Use bioc-devel

BioC2019 workshops will run on **bioc-devel (3.10)**. That means that this book will be built on bioc-devel, workshop participants will use virtual machines running bioc-devel, and your workshops will be tested against bioc-devel. See [Using ‘bioc-devel’ during mid-April to mid-October](https://www.bioconductor.org/developers/how-to/useDevel/) for how to run bioc-devel; thankfully we are in the easy time of year for running release and devel side-by-side. Also, the [dummy chapter](https://github.com/lpantano/dummychapter1) includes a highly recommendable TravisCI setup for Continuous Integration against bioc-devel.

## Deadlines for Bioc2019

Please be aware of the following deadlines for the [Bioconductor 2019 Conference][] in New York

- **Mon May 27:** draft workshop materials submitted as an Issue to this Bioconductor GitHub repo
- **Mon June 10:** complete workshop submitted. Only bugfixes / refinements should be made after this point.
- **Mon June 17:** All workshops complete and building without error. No new commits to contributor repos will be incorporated.

[BiocWorkshops issue]: https://github.com/Bioconductor/BiocWorkshops2019/issues
[Bioconductor 2019 Conference]: https://bioc2019.bioconductor.org/

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.
