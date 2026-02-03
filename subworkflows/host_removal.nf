/*
========================================================================================
    Subworkflow: host_removal
    Build BMTagger index (if needed), identify host reads per FASTQ,
    then remove them to produce dehosted FASTQs.
========================================================================================
*/
/*
========================================================================================
    IMPORT MODULES
========================================================================================
*/

//include { bmtagger_index } from '../modules/bmtagger_index.nf'
include { bmtagger_hostIDs } from '../modules/bmtagger_hostIDs.nf'
//include { remove_host_reads }    from '../modules/remove_host_rds.nf'


/*
========================================================================================
    WORKFLOW
========================================================================================
*/
workflow host_removal {
    take:
    trimmed_fastqs

    main:
    hostIDs_ch = bmtagger_hostIDs(trimmed_fastqs.flatten())

}


