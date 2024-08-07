# Impact of degradation and time of sampling on skipjack tuna (*Katsuwonus pelamis*) gut microbiome composition
------------------------

## Introduction
The gut microbiome has the potential to be an effective indicator of individual and population health in fish given its sensitivity to internal and external stressors. However, without consistent and tested sampling protocols, its utility may be limited. Routine sampling of fish caught by commercial fisheries rarely occurs at the time of capture and more commonly occurs hours, days, or weeks after fish capture when the catch is unloaded in port. This delay in sampling provides time for the degradation and decomposition of the microbiome community potentially compromising the reliability of gut microbiome analyses. Unfortunately, these changes in the gut microbiome communities after the capture event are rarely investigated, with unknown consequences for the interpretation of the microbiome studies. Here, we investigated the post-mortem changes in the gut microbiome of skipjack tuna (*Katsuwonus pelamis*) preserved in RNA*later* at five different time points (immediately, 2 hours, 24 hours, 12 days, and 24 days after fish capture). 

This GitHub repository includes all scripts which used to conduct bioinformatics and statistical analyses for this study. The raw sequence data is accessible in NCBI database with project number PRJNA1095190 (https://www.ncbi.nlm.nih.gov/sra/PRJNA1095190).


## General workflow
All FASTQ files were generated by Illumina Miseq using a V3 2x300bp (600 cycles) sequencing kit in one batch. The generated FASTQ file was automatically demultiplexed and the primers and adapters were removed by the Illumina Local Run Manager. 
The bioinformatics analysis was then carried out in QIIME2 (version 2021.4.0). Briefly, The demultiplexed FASTQ files were quality-evaluated, denoised, filtered, and merged using DADA2 (1.22.0), Multiple sequence alignment of Amplicon Sequence Variants (ASVs) was performed using MAFFT, and Chimeras were removed using DADA2.
Taxonomic information was assigned to each ASV against a curated SILVA (138) reference database with only 16S rRNA V3-V4 region sequences. 

Data cleaning, statistical analyses, and visualization were performed using R (version 4.1.2) within RStudio (version 2022.2.0.443). Data cleaning was conducted using phyloseq package (version 1.38.0) and microbiome package (version 1.23.1). Then diversity analyses, stastical anslyses, and significance test were using the microbiome and stats packages. Data visualization utilized the ggplot2 package (version 3.4.0) 

## File description
**qiime_denoising.sh** includes command lines for FASTQ file input and denoising using DADA2 in QIIME2.
**qiime_taxonomic_assignment.sh** includes command lines for assigning taxonomy to ASVs against a curated SILVA (138) reference database with only 16S rRNA V3-V4 region sequences.
**TGM_statistical.Rmd** is the R script for data cleaning, diversity analyses and statistical analyses. 
**TGM_taxonomic.Rmd** is the R script for taxonomy analyses, including the relative abundance analyses and changes in important microbiome families.


