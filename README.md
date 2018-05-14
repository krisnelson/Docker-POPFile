# Docker-POPFile
An unofficial docker container for POPFile 1.1.3 [EXPERIMENTAL]

**WARNING:** Still experimental.

## Build with docker
docker build git@github.com:krisnelson/Docker-POPFile.git --tag popfile

## Run with docker (persist data on local filesystem, interace at port 
7070)
docker run -d -p 7070:8080 -v /home/popfile/popfile-data/:/data popfile

## POPFile
POPFile automatically sorts your email messages and fights spam. See:
http://getpopfile.org/


