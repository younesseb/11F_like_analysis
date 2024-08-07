# 11F_like_analysis

## Running the scripts
After using snippy input, cleaning up script and running gubbins, snp sites are loaded and run and gets applied into FastTree in order to create the phylogenetic tree. Script below allocates space, compresses the process and allows tree to generate.
To run `generate_tree.sh`:
`bsub -R "select[mem>40000] rusage[mem=40000]" -M40000 -n 16 -o tree_job.o  -e tree_job.e -J tree_job bash generate_tree.sh`
