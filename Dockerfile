FROM alpine:latest
LABEL maintainer="Kristopher Nelson <kristopher+docker-popfile@krisnelson.org>"

# Update base system
RUN	apk update && \
	apk upgrade && \
 	apk add --no-cache ca-certificates && \
 	update-ca-certificates && \

# Install Perl dependencies
	apk add perl \
		perl-dbi \
		perl-dbd-sqlite \
		perl-date-format \
		perl-html-template \
		perl-io-socket-ssl \
		perl-html-tagset && \

# Get source of POPFile
	wget http://getpopfile.org/downloads/popfile-1.1.3.zip && \
	unzip popfile-1.1.3.zip && \
	chmod ug+x popfile.pl

# A data/config/storage volume
RUN 	mkdir /Data
VOLUME ["/Data"]

# Available ports
EXPOSE 110 8080

# Directories
ENV	POPFILE_ROOT=/ \
	POPFILE_USER=/Data

WORKDIR /data
CMD ["perl", "/popfile.pl", "--set", "html_local=0"]
