## Running workshop materials locally

The workshops (except the CWL workshop) are all installed and
ready-to-run inside [docker]; you will need to *install docker* on your machine to 
follow along. However, the docker image and 
installed packages are separate. To use the entire set of workshop materials, do:

- Make a directory for the installed packages:

    ```
    mkdir ~/bioc-libs/
    ```
 
- Download and untar entire tar.gz file with all installed packages and materials:

    ```
    cd ~/bioc-libs
    wget https://s3.amazonaws.com/biocbuild.cancerdatasci.org/bioc2019-usr-local.tar.gz
    tar -xzf bioc2019-usr-local.tar.gz
    ```
    
- Run docker locally with (you may or may not need `sudo` depending on your docker setup):
    
    ```
    sudo docker run --name bioc_2019 -d -v ~/bioc-libs:/usr/local/lib/R/site-library \
        --restart=always \
        -p 80:8787 -e PASSWORD=bioc seandavi/bioc_2019
    ```

- Credentials:
  - username: 'rstudio'
  - password: 'as you set it--bioc above'

[docker]: https://docker.io
