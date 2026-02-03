process bmtagger_index {

    publishDir "${params.outdir}/host_srprism_index", mode: 'copy'
    //container 'community.wave.seqera.io/library/bmtagger_bmtool_tagger:7d23436ee8bcb562'
    conda 'bmtagger_env.yml'

    input:
    path host_fasta

    output:
    path("host_srprism_index"), emit: srprism_index
    path("mussel.bitmask"), emit: bitmask_file

    script:
    """

    # Build bitmask
    bmtool -d ${host_fasta} -o mussel.bitmask -A 0

    # Build srprism index
    srprism mkindex -i ${host_fasta} -o host_srprism_index
    """
}

