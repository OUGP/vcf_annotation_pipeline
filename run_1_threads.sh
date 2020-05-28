#!/bin/bash -x

snakemake \
-j 1 \
--use-conda \
--use-singularity \
--singularity-args '-B /store/lkemp/' \
--configfile ./config/resource_benchmarking.yml