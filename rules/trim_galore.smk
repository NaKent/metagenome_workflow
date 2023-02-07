rule quality_control_trimgalore:
    input:
        expand("fastq/{SRA_accession_number}_1.fastq", SRA_accession_number=array_of_accession_number),
        expand("fastq/{SRA_accession_number}_2.fastq", SRA_accession_number=array_of_accession_number)
    output:
        temp(expand("fastq/{SRA_accession_number}_1_val_1.fq", SRA_accession_number=array_of_accession_number)),
        temp(expand("fastq/{SRA_accession_number}_2_val_2.fq", SRA_accession_number=array_of_accession_number))
    shell:
        "trim_galore --paired {input}"
