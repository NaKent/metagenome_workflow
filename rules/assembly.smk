rule assembly:
    input:
        ss
    output:
        ss
    shell:
        expand("fastq/{SRA_accession_number}_removedUnmapped.out.mate1", SRA_accession_number=array_of_accession_number),
        expand("fastq/{SRA_accession_number}_removedUnmapped.out.mate2", SRA_accession_number=array_of_accession_number)