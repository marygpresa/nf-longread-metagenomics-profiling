#!/usr/bin/env nextflow
nextflow.enable.dsl=2

include { basecalling } from './modules/basecalling.nf'

workflow {
    // Provide a single pod5 directory via params.pod5_dir
    pod5_ch = Channel.of(file(params.pod5_dir))

    // Call the included process and print emitted output
    basecalls_ch = basecalling(pod5_ch).basecalls
    basecalls_ch.view()
}
