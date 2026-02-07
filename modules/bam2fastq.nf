process bam2fastq {

    container "quay.io/biocontainers/samtools:1.23--h96c455f_0"
    // tag { demux.baseName }
    publishDir "${params.outdir}/fastqs",mode: 'copy'

    input:
    path demux //demultiplexing output
    
    // publishDir "fastqs", mode: 'copy'
    
    output:
    path "${demux}.fastq", emit: fastqs

    script:
    """
    
    samtools fastq --threads 20 -0 ${demux}.fastq $demux
    """

}