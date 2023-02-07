rule download_fastq_from_SRAdatabase:
    output:
        left_end_fastq = expand("fastq/{sample}_1.fastq", sample = config["SRR"]),
        right_end_fastq = expand("fastq/{sample}_2.fastq", sample = config["SRR"])
    params:
        accession_number=expand("{sample}", sample=config["SRR"])
    shell:
        "cd fastq"
        "fasterq-dump -e 8 {params}"



