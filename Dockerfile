# LOOK AT chttps://github.com/danielquinn/paperless
# for next steps on this very initial Dockerfile
FROM alpine
LABEL maintainer="Kristopher Nelson <kristopher+docker-popfile@krisnelson.org>"

RUN	apk update && \
# Install Perl dependencies
	apk add perl \
		perl-dbi \
		perl-dbd-sqlite \
		perl-date-format \
		perl-html-template \
		perl-html-tagset && \
# Get source of POPFile
	wget http://getpopfile.org/downloads/popfile-1.1.3.zip && \
	unzip popfile-1.1.3.zip && \
	chmod ug+x popfile.pl

# A data/config/storage volume
RUN 	mkdir /data
VOLUME ["/data"]

# Available ports
EXPOSE 110 8080

# Directories
ENV	POPFILE_ROOT=/ \
	POPFILE_USER=/data

WORKDIR /data
CMD ["/popfile.pl", "--set html_local=0"]
