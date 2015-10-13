#!/bin/bash

echo $BCBIO_UID $BCBIO_HOME $BCBIO_USER

BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

if ! id -u $BCBIO_USER > /dev/null 2>&1; then
  echo "use local user: " ${BLUE}$BCBIO_USER${NC}
  adduser -u  $BCBIO_UID $BCBIO_USER
fi

if [ -e $BCBIO_GENOMES ];
  then
    echo ${GREEN}$BCBIO_GENOMES${NC} exists
    chown -R $BCBIO_UID $BCBIO_GENOMES
else
  mkdir -p $BCBIO_GENOMES
  chown -R $BCBIO_UID $BCBIO_GENOMES
fi

if [ -e $BCBIO_DATA ];
  then
    echo ${GREEN}$BCBIO_DATA${NC} exists
    chown -R $BCBIO_UID $BCBIO_DATA
else
  mkdir -p $BCBIO_DATA
  chown -R $BCBIO_UID $BCBIO_DATA
fi

if [ -e $BCBIO_CONFIG ];
  then
    echo ${GREEN}$BCBIO_CONFIG${NC} exists
    chown -R $BCBIO_UID $BCBIO_CONFIG
else
  mkdir -p $BCBIO_CONFIG
  chown -R $BCBIO_UID $BCBIO_CONFIG
fi

if [ -e $BCBIO_GALAXY ];
  then
    echo ${GREEN}$BCBIO_GALAXY${NC} exists
    chown -R $BCBIO_UID $BCBIO_GALAXY
else
  mkdir -p $BCBIO_CONFIG
  chown -R $BCBIO_UID $BCBIO_GALAXY
fi
# chown -R $BCBIO_UID $BCBIO_GENOMES
# chown -R $BCBIO_UID $BCBIO_DATA

for arg in "$*"
do
  	exec  $*
done
