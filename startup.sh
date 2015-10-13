#!/bin/bash

echo $BCBIO_UID $BCBIO_HOME $BCBIO_USER

if ! id -u $BCBIO_USER > /dev/null 2>&1; then
  echo "use local user: " $BCBIO_USER
  adduser -u  $BCBIO_UID $BCBIO_USER
fi

if [ -e $BCBIO_GENOMES ];
  then
    echo $BCBIO_GENOMES exists
    chown -R $BCBIO_UID $BCBIO_GENOMES
else
  mkdir -p $BCBIO_GENOMES
  chown -R $BCBIO_UID $BCBIO_GENOMES
fi

#chown -R $BCBIO_UID $BCBIO_GENOMES
chown -R $BCBIO_UID $BCBIO_DATA

for arg in "$*"
do
  	exec  $*
done
