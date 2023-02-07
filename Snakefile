configfile: "config.yaml"
with open('accession.list') as accession_file:
    array_of_accession_number = accession_file.read().splitlines()

rule all:
    input:
        "plot/quals.svg"


include: "rules/trim_galore.smk"
include: "rules/remove_host_genome.smk"

rule plot_quals:
    input:
        expand("fastq/{SRA_accession_number}_removedUnmapped.out.mate1", SRA_accession_number=array_of_accession_number),
        expand("fastq/{SRA_accession_number}_removedUnmapped.out.mate2", SRA_accession_number=array_of_accession_number)
    output:
        "plot/quals.svg"
    script:
        "scripts/plot-quals.py"