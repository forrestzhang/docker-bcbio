FROM ubuntu

MAINTAINER Tao Zhang "forrestzhang1982@gmail.com"

RUN apt-get update && apt-get install -y build-essential \
								  zlib1g-dev \
								  zlibc \
								  openjdk-7-jre \
								  git \
								  libboost-dev \
								  autoconf \
								  libncursesw5-dev \
								  libncurses5 \
								  ncurses-dev \
								  libboost-thread-dev \
								  python3-pip \
								  samtools \
								  unzip \
									python \
									curl \
                  wget \
                  libssl-dev \
                  libcurl4-openssl-dev \
                  perl \
                  libperl-dev \
                  libxml2-dev \
                  libncurses5-dev \
									irb


# FROM chapmanb/bcbio-nextgen-devel

ENV BCBIO_USER=bcbio \
    BCBIO_UID=1555 \
    BCBIO_GID=1555 \
    BCBIO_HOME=/home/bcbio

RUN groupadd -r $BCBIO_USER -g $BCBIO_GID
RUN useradd -u $BCBIO_UID -r -g $BCBIO_USER -d $BCBIO_HOME -c "Bcbio user" $BCBIO_USER
#    gpasswd -a $BCBIO_USER docker

#RUN mkdir -p /mnt/transfer
WORKDIR /home/bcbio
RUN mkdir /home/bcbio/tools
ADD https://raw.github.com/chapmanb/bcbio-nextgen/master/scripts/bcbio_nextgen_install.py  /home/bcbio/bcbio_nextgen_install.py
RUN python /home/bcbio/bcbio_nextgen_install.py /home/bcbio  --tooldir=/home/bcbio/tools --nodata

ENV BCBIO_GENOMES=$BCBIO_HOME/genomes \
		BCBIO_DATA=$BCBIO_HOME/data \
		BCBIO_CONFIG=$BCBIO_HOME/config \
		BCBIO_GALAXY=$BCBIO_HOME/galaxy \
		BCBIO_GALAXY_BK = $BCBIO_HOME/galaxy_backup \
		BCBIO_CONFIG_BK = $BCBIO_HOME/config_backup

ENV PATH=$BCBIO_HOME/tools/bin/:$PATH

RUN mkdir ${BCBIO_GALAXY_BK} && cp ${BCBIO_GALAXY}/*  ${BCBIO_GALAXY_BK}/
RUN mkdir ${BCBIO_CONFIG_BK} && cp ${BCBIO_CONFIG}/*  ${BCBIO_CONFIG_BK}/

#RUN mkdir $BCBIO_GALAXY

#VOLUME [${BCBIO_GENOMES}, ${BCBIO_DATA}, ${BCBIO_CONFIG}, ${BCBIO_GALAXY}]


ADD ./startup.sh /usr/bin/startup
RUN chmod +x /usr/bin/startup

ENTRYPOINT ["/usr/bin/startup"]
