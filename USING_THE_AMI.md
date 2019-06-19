## Using the Amazon Machine Image

The AMI ID is currently: ``

You can launch the AMI using the command line `aws` utility, an SDK like boto3/python, or
from the Amazon Web Services Console. 

### Security group

The following ports need to be open:

- Port 80 (rstudio running on docker)
- Port 8080 (rstudio running on AMI hardware)
- Port 22 (for ssh access to machine)

## FAQ

- What is the difference between the port 80 and port 8080 versions?

The port 80 version is identical to what you would get if you follow the [RUN_LOCAL.md](RUN_LOCAL.md) instructions.
The port 8080 includes installed `docker`, `cwltool`, and `hisat2` for running CWL-based workflows, etc. 

- What is the username and password?
  - Port 80:
    - username: `rstudio`
    - password: `bioc`
  - Port 8080
    - username: `ubuntu`
    - password: `bioc`
