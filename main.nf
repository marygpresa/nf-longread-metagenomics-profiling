#!/usr/bin/env nextflow

/*
========================================================================================
    IMPORT MODULES & SUBWORFLOWS
========================================================================================
*/
include { prepare_fastqs }    from './subworkflows/prepare_fastqs.nf'
include { fastplong }         from './modules/fastplong.nf'
// include { host_removal }         from './subworkflows/host_removal.nf' - optional
include { profiling_kraken } from './subworkflows/profiling_kraken.nf'

/*
========================================================================================
    WORKFLOW
========================================================================================
*/
workflow {

    // 1) convert BAM to FASTQ prepare files
    fastqs_ch = prepare_fastqs()

    // 2) trim/adapter-clean
    trimmed_ch = fastplong(fastqs_ch).trimmed_fastqs

    // 3) remove host reads optional
    dehost_ch   = host_removal(trimmed_ch).hostIDs

    //hostIDs_ch = host_removal(trimmed_ch, host_fasta_ch).hostIDs
    
    //dehosted_ch = host_removal(trimmed_ch, params.host_fasta).dehost_fastqs

    // 4) profiling with kraken and bracken
    //profiling_kraken()
}
