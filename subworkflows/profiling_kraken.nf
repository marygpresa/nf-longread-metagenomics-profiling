include { kraken2_classify } from '../modules/kraken2_classify.nf'
include { bracken_estimate } from '../modules/bracken_estimate.nf'

workflow profiling_kraken {

    // Channel for FASTQs
    fastqs = Channel.fromPath("${params.fastq_kraken}/*.fastq")

    // Run Kraken2 classify process
    kraken_out = kraken2_classify(fastqs.flatten())

    //Run Bracken
    bracken_out = bracken_estimate(kraken_out.reports.flatten(), params.kraken_db)
}

