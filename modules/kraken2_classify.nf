process kraken2_classify {

    tag {fastq.simpleName}

    publishDir "${params.outdir}/kraken2", mode: 'copy'
    container "quay.io/biocontainers/kraken2:2.1.3--pl5321hdcf5f25_3" //kraken2

    input:
    path fastq

    output:
    path("*_k2repor*.txt"), emit: reports
    path("*_k2classified.out"), emit: classified_reads
    path("*_k2unclassified.out"), emit: unclassified_reads
    path("*_k2.log"), emit: kraken_logs_aux

    script:
    """
    kraken2 \
      --db ${params.kraken_db} \
      --threads ${params.threads_kraken} \
      --memory-mapping \
      --use-names \
      --confidence ${params.confidence_kraken} \
      --classified-out ${fastq.simpleName}_k2classified.out \
      --unclassified-out ${fastq.simpleName}_k2unclassified.out \
      --report ${fastq.simpleName}_k2report.txt \
      ${fastq} \
      2>&1 | tee ${fastq.simpleName}_k2.log

    """
}