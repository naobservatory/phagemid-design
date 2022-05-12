#!/bin/bash
#SBATCH --exclusive
#SBATCH --mem=0
set -euo pipefail

# check the number of available threads
n=$(nproc)
echo Number of available threads: $n

blastn -db ~/data/ncbi/nt/nt -query primers-and-probes.fasta \
    -task blastn-short \
    -num_threads $n \
    -out results.tsv -outfmt 6
