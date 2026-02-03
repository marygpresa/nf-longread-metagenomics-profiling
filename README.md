# nf-longread-metagenomics-profiling

# Long-read Metagenomic ONT data Nextflow Pipeline
A modular Nextflow pipeline for processing long-read sequencing data (BAM/POD5/FASTQ) and generating taxonomic profiles using Kraken.

This pipeline is designed to be reusable across environmental and biological datasets.
An example application is environmental DNA analysis in freshwater mussel samples.

## Features
- Modular Nextflow DSL2 structure
- Long-read preprocessing
- Taxonomic profiling
- Reproducible and portable workflows

## Context
This pipeline is a subset og the overall project DCEMP found in https://github.com/DACossey/DCEMP. The overall project aimed to develope an environmental pipeline for identifying  pathogenes causing massive extintion events in freshwater bivalves. Downstream analysis of that project should be published in the DCEMP repository.

This is the subset of the project were I helped developed the pipeline but I wanted to share a very general approach for users to be able to automatically profile their long-reads and identify their samples among different fields.

## Status
in process, updating