# LOOK AT chttps://github.com/danielquinn/paperless
# for next steps on this very initial Dockerfile
FROM alpine
LABEL maintainer="Kristopher Nelson <kristopher+docker-popfile@krisnelson.org>"

RUN apk update && apk add perl \
	perl-dbi \
	perl-dbd-sqlite \
	perl-date-format \
	perl-html-template \
	perl-html-tagset 
RUN wget http://getpopfile.org/downloads/popfile-1.1.3.zip && \
	unzip popfile-1.1.3.zip && \
	chmod ug+x popfile.pl
CMD ["./popfile.pl"]
