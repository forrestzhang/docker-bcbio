Docker pull
======

USE
====
Load and download reference genome
--------------
```bash
docker run   -e BCBIO_USER=$USER -e BCBIO_UID=$UID -v LOCALDIR/genomes:/home/bcbio/genomes -v LOCALDIR/data:/home/bcbio/data -v LOCALDIR/config:/home/bcbio/config  bcbio-test:t1 bcbio_nextgen.py upgrade --genomes TAIR10 --aligners bowtie --aligner bwa
```

genome files will be saved to LOCALDIR/genomes, for example.
If you set LOCALDIR as /home/forrest/Docker/bcbiodata, the genome files will be saved to your local dir /home/forrest/Docker/bcbiodata/genomes .

Build custom genomes
-------
Build a rice TIGR7 genome.
```
pwd
/home/forrest/Docker/bcbiodata
```

<!-- Download genome fasta file.
```
mkdir data
cd data
wget  ftp://ftp.plantbiology.msu.edu/pub/data/Eukaryotic_Projects/o_sativa/annotation_dbs/pseudomolecules/version_7.0/all.dir/all.con
wget ftp://ftp.plantbiology.msu.edu/pub/data/Eukaryotic_Projects/o_sativa/annotation_dbs/pseudomolecules/version_7.0/all.dir/all.gff3
```

Build bwotie2 star seq index
```bash
docker run   -e BCBIO_USER=$USER -e BCBIO_UID=$UID -v /home/forrest/Docker/bcbiodata/genomes:/home/bcbio/genomes -v /home/forrest/Docker/bcbiodata/data:/home/bcbio/data -v /home/forrest/Docker/bcbiodata/config:/home/bcbio/config  bcbio-test:t1 bcbio_setup_genome.py -f /home/bcbio/data/all.con -g /home/bcbio/data/all.gff3 -i bowtie2 star seq -n Rice -b TIGR7
``` -->

<!-- Download ChIP-seq reads
```
mkdir /home/forrest/Docker/bcbiodata/data/cenH3/input
cd /home/forrest/Docker/bcbiodata/data/cenH3/input
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR975/SRR975442/SRR975442_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR975/SRR975442/SRR975442_2.fastq.gz
``` -->
Download ChIP-seq reads
```
mkdir /home/forrest/Docker/bcbiodata/data/ath_H3K27ac/input
cd /home/forrest/Docker/bcbiodata/data/ath_H3K27ac/input
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR150/004/SRR1509474/SRR1509474_1.fastq.gz
wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR150/004/SRR1509474/SRR1509474_2.fastq.gz
```

Create YAML file
```
mkdir /home/forrest/Docker/bcbiodata/data/ath_H3K27ac/config
cd /home/forrest/Docker/bcbiodata/data/ath_H3K27ac/config
nano Ath_leaf_H3K27ac.yaml
```

Ath_leaf_H3K27ac.yaml file:
```
fc_data: '101215'
fc_name: 'Ath_leaf_H3K27ac'

upload:
  dir: ../final
details:
  - analysis: chip-seq
    genome_build: TAIR10
    files: [/home/bcbio/data/ath_H3K27ac/input/SRR1509474_1.fastq.gz, /home/bcbio/data/ath_H3K27ac/input/SRR1509474_2.fastq.gz]
    description: 'Arabiodpsis Leaf H3K27ac ChIP-seq'
    algorithm:
      aligner: bowtie2
      trim_reads: read_through
      adapters: [truseq]

```
