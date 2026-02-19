process demultiplexing {
    
    container "nanoporetech/dorado:latest"

    tag "demux"
    publishDir "${params.outdir}/demux_bams", mode: 'copy'

    input:
    path basecalling

    output:
    path "demux_output/*.bam", emit: demux_bams

    script:
    """
    mkdir -p demux_bams demux_output
    
    dorado demux -t 20 \
        --output-dir demux_bams \
        --kit-name ${params.kit_name} \
        ${basecalling}
    
    # Find all BAM files in bam_pass and copy to demux_output
    find demux_bams -name "*.bam" -type f -path "*/bam_pass/*" -exec cp {} demux_output/ \\;
    
    # Verify BAM files were created
    BAM_COUNT=\$(find demux_output -name "*.bam" -type f | wc -l)
    if [ \$BAM_COUNT -eq 0 ]; then
        echo "ERROR: No BAM files found after demultiplexing"
        find demux_bams -type f
        exit 1
    fi
    echo "Found \$BAM_COUNT BAM files"
    """

    // need to run mkdir because directory needs to exist before running demux
}
