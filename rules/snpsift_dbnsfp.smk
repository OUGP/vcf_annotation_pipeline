rule SnpSift_dbNSFP:
    input:
        vcf = "filtered/{sample}_filtered.vcf",
        dbnsfp = expand("{dbnsfp}", dbnsfp = config['dbNSFP'])
    output:
        vcf = temp("annotated/{sample}_filtered_dbnsfp.vcf")
    params:
        "-v"
    log: 
        "logs/snpsift_dbnsfp/{sample}.log"
    benchmark:
        "benchmarks/snpsift_dbnsfp/{sample}.snpsiftdbnsfp"
    conda:
        "../envs/dbnsfp.yaml"
    threads: 32
    message:
        "Using the dbNSFP database to annotate variants with functional predictions from multiple algorithms (SIFT, Polyphen2, LRT and MutationTaster, PhyloP and GERP++, etc.)"
    shell:
        "( /usr/bin/time SnpSift -Xmx16g dbnsfp {input.vcf} > {output.vcf} -db {input.dbnsfp} {params} -t {threads} ) 2> times/snpsift_dbnsfp.stderr"