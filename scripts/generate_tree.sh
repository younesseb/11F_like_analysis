#!/bin/bash

#load necessary modules
module load samtools/1.9 snippy/4.6.0 gubbins/3.2.1 snp-sites/2.5.1--hed695b0_0 fasttree/2.1.10--h470a237_2

#command generate input file for snippy

#creating snippy input
bash make_snippy_file.sh > snippy_input.tab
#running snippy multi (8cpus)
snippy-multi snippy_input.tab --ref 11A.gb --cpus 8 > runme.sh
#runme script job (time consuming)
sh runme.sh
#cleaning output for better processing
snippy-clean_full_aln core.full.aln > clean.full.aln
#running gubbins
run_gubbins.py -p gubbins clean.full.aln
#snp sites running after being loaded
snp-sites -c gubbins.filtered_polymorphic_sites.fasta > clean.core.aln
#apply everything into FastTree to create phylogenetic tree
FastTree -gtr -nt clean.core.aln > clean.core.tree
