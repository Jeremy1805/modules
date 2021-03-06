#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { SAMTOOLS_FLAGSTAT } from '../main.nf'

workflow test {

    def input = []
    input = [ [ id:'test', single_end:false ], // meta map
              file("${baseDir}/input/test.paired_end.sorted.bam", checkIfExists: true),
              file("${baseDir}/input/test.paired_end.sorted.bam.bai", checkIfExists: true) ]

    SAMTOOLS_FLAGSTAT ( input, [:] )
}

workflow {
    test()
}
