## Analysis of Helicos RNA seq reads

This repository contains the necessary steps to analyze Helicos RNA-Seq data for microbiome samples. 

### dependencies

    1. Uclust
    2. Python

### usage
here are the main steps to run the analysis

#### build metadata file
A metadata file is a simple text file that contains the information about each sample. For instance, a metadata file should look like this:

    PYG-L1  Ruminococcous_gauvreauii        P13.2017-08-23T14_56_30.0249460681073.fc1.ch1.filtered
    TSY-L1  Enterococcus_caccae     P13.2017-08-23T14_56_30.0249460681073.fc1.ch5.filtered

where:

    Column 1: Sample name
    Column 2: Genome
    Column 3: fasta file with Helicos reads

#### run the scripts
You just need to execute the following script:

    sh uclust-many.sh $1 $2 $3 $4 $5

where: 

    $1: path to the git repository (scripts) in local machine
    $2: directory with the reference genomes 
    $3: directory where the raw reads are stored
    $4: text file with metadata
    $5: stage: 1 -> run alignment + analysis, 2 -> run analysis

### This repository has been used in the following studies.
    1. Apigenin Impacts the Growth of the Gut Microbiota and Alters the Gene Expression of Enterococcus Minqian Wang 1,2, Jenni Firrman 1,*, Liqing Zhang 3, Gustavo Arango-Argoty 3, Peggy Tomasula 1Orcid, LinShu Liu 1, Weidong Xiao 4 and Kit Yam 2