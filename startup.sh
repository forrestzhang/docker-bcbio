#!/bin/bash

echo $BCBIO_UID $BCBIO_HOME

chown -R $BCBIO_UID $BCBIO_HOME

for arg in "$*"
do
  	exec  $*
done

# if [-e /mnt/transfer]
#     then
#         echo "/mnt/transfer exists."
#         chown -R $BCBIO_UID:$BCBIO_GID /mnt/transfer
# else
#     mkdir -p /mnt/transfer
#     chown -R $BCBIO_UID:$BCBIO_GID /mnt/transfer
# fi
#
#
# if [-e /mnt/biodata]
#   then
#     echo "/mnt/biodata exists."
#     chown -R $BCBIO_UID:$BCBIO_GID /mnt/biodata
#   else
#     mkdir -p /mnt/biodata
#     mv /usr/local/share/bcbio-nextgen/galaxy/bcbio_system.yaml /usr/local/share/bcbio-nextgen/config && \
#     rmdir /usr/local/share/bcbio-nextgen/galaxy && \
#     ln -s /mnt/biodata/galaxy /usr/local/share/bcbio-nextgen/galaxy && \
#     ln -s /mnt/biodata/gemini_data /usr/local/share/bcbio-nextgen/gemini_data && \
#     ln -s /mnt/biodata/genomes /usr/local/share/bcbio-nextgen/genomes && \
#     ln -s /mnt/biodata/liftOver /usr/local/share/bcbio-nextgen/liftOver && \
#     chown -R $BCBIO_UID:$BCBIO_GID /mnt/biodata
# fi
