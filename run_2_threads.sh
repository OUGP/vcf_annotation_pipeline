#!/bin/bash -x

snakemake \
-j 2 \
--use-conda \
--use-singularity \
--singularity-args '-B /store/lkemp/' \
--configfile ./config/resource_benchmarking.yml