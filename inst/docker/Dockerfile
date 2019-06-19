FROM bioconductor/bioconductor_full:devel

RUN apt-get update
RUN apt-get install -y libudunits2-dev libgdal-dev libgeos-dev libproj-dev
RUN apt-get install -y cwltool hisat2
RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common

RUN Rscript -e 'BiocManager::install("remotes")'

RUN pip install virtualenv
RUN Rscript -e 'BiocManager::install("tensorflow")'
RUN Rscript -e 'tensorflow::install_tensorflow()'

RUN groupadd docker
RUN usermod -aG docker bioc
RUN usermod -aG docker rstudio

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
RUN apt-get update
RUN apt-get install -y docker-ce
