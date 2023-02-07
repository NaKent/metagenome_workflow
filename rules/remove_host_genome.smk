def get_bwa_input_fastqs(wildcards):
    return array_of_accession_number

rule remove_host_genome:
    input:
        F_read=expand("fastq/{SRA_accession_number}_1_val_1.fq", SRA_accession_number=array_of_accession_number),
        R_read=expand("fastq/{SRA_accession_number}_2_val_2.fq", SRA_accession_number=array_of_accession_number)
    output:
        temp(expand("fastq/{SRA_accession_number}_removedUnmapped.out.mate1", SRA_accession_number=array_of_accession_number)),
        temp(expand("fastq/{SRA_accession_number}_removedUnmapped.out.mate2", SRA_accession_number=array_of_accession_number))
    params:
        prefix=expand(array_of_accession_number)
    shell:
        "STAR --runMode alignReads --runThreadN 36 --genomeDir /home/nakahara/RNAseq_tabacum/STAR/IDNEX \
        --readFilesIn {input.F_read} {input.R_read} \
        --outSAMunmapped Within --outFilterMultimapNmax 30 --outFilterMultimapScoreRange 1 \
        --outSAMattributes All --outStd BAM_Unsorted --outSAMtype BAM Unsorted \
        --outFilterType BySJout --outReadsUnmapped Fastx --outFilterScoreMin 10 \
        --limitGenomeGenerateRAM 500000000000 \
        --outFileNamePrefix {params.prefix}_removed"