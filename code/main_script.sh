#!/bin/bash

# ------------------------------------------------------------------------------------
#
# Preprocessing UK Biobank genotype_500k - Main file
#
# ------------------------------------------------------------------------------------
#
# This script prepares the code to create an HDF5 file from the original PLINK data
#
# Steps:
#   1. Convert with GCONV original files in .cal format to .ped
#   2. Create .raw file with an additive encoding
#   3. Convert the .raw file to HDF5
#
# First Version: July 2016, D. Roqueiro
#
# Adapted Version for UKBiobank 500K Data: February, 2020 L. Bourguignon
# With the contribution of C. Jutzeler and C. Weis
#
# ------------------------------------------------------------------------------------

source paths_and_parameters.sh

# ------------------------------------------------------------------------------------

# STEP 1 : Select SNPs which have IDs

#bash ./steps_code/1_select_SNPs_with_IDs.sh

# -----------------------------------EXAMPLE-OUTPUT-----------------------------------

# Note: Output from EULER when executing QCTOOL on chr 1 (largest) and chr 22 (smallest)
#   CHR 1 
#       Resource usage summary:
  
#       CPU time :               9678.50 sec.
#       Max Memory :             62401 MB
#       Average Memory :         47431.16 MB
#       Total Requested Memory : 24576.00 MB
#       Delta Memory :           -37825.00 MB
#       (Delta: the difference between Total Requested Memory and Max Memory.)
#       Max Processes :          3
#       Max Threads :            4
# Summary:
#   Number of samples: 152,249
#   Number of SNPs:     61,969
#   Avg. time per SNP:      ~1 microsecond

#   CHR 22
#       Resource usage summary:
      
#           CPU time :               1791.27 sec.
#           Max Memory :             32772 MB
#           Average Memory :         17599.02 MB
#           Total Requested Memory : 24576.00 MB
#           Delta Memory :           -8196.00 MB
#           (Delta: the difference between Total Requested Memory and Max Memory.)
#           Max Processes :          3
#           Max Threads :            4
# Summary:
#   Number of samples: 152,249
#   Number of SNPs:     12,622
#   Avg. time per SNP:      ~1 microsecond

# ------------------------------------------------------------------------------------

# STEP 2 : Convert .gen files to .ped and .map

#bash ./steps_code/2_convert_gen_pedmap.sh

# -----------------------------------EXAMPLE-OUTPUT-----------------------------------


# ------------------------------------------------------------------------------------

# STEP 3 : Remove duplicate SNPs and subjects excluded from analysis (withdrawal, do not meet inclusion criteria)

bash ./steps_code/3_exclusion_duplicates.sh

# -----------------------------------EXAMPLE-OUTPUT-----------------------------------

# PLINK v1.90b3d 64-bit (10 Feb 2015)        https://www.cog-genomics.org/plink2
# (C) 2005-2015 Shaun Purcell, Christopher Chang   GNU General Public License v3
# Logging to /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.makebed.log.
# 515868 MB RAM detected; reserving 257934 MB for main workspace.
# .ped scan complete (for binary autoconversion).
# Performing single-pass .bed write (11923 variants, 487409 people).
# --file:
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.makebed-temporary.bed
# +
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.makebed-temporary.bim
# +
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.makebed-temporary.fam
# written.
# 11923 variants loaded from .bim file.
# 487409 people (223006 males, 264318 females, 85 ambiguous) loaded from .fam.
# Ambiguous sex IDs written to
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.makebed.nosex
# .
# Using 1 thread (no multithreaded calculations invoked).
# Before main variant filters, 487409 founders and 0 nonfounders present.
# Calculating allele frequencies... done.
# 11923 variants and 487409 people pass filters and QC.
# Note: No phenotypes present.
# --make-bed to
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.makebed.bed
# +
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.makebed.bim
# +
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.makebed.fam
# ... done.
# PLINK v1.90b3d 64-bit (10 Feb 2015)        https://www.cog-genomics.org/plink2
# (C) 2005-2015 Shaun Purcell, Christopher Chang   GNU General Public License v3
# Logging to /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.log.
# 515868 MB RAM detected; reserving 257934 MB for main workspace.
# 11923 variants loaded from .bim file.
# 487409 people (223006 males, 264318 females, 85 ambiguous) loaded from .fam.
# Ambiguous sex IDs written to
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.nosex
# .
# Using 1 thread (no multithreaded calculations invoked).
# Before main variant filters, 487409 founders and 0 nonfounders present.
# Calculating allele frequencies... done.
# 11923 variants and 487409 people pass filters and QC.
# Note: No phenotypes present.
# List of variant IDs written to
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.snplist
# .
# PLINK v1.90b3d 64-bit (10 Feb 2015)        https://www.cog-genomics.org/plink2
# (C) 2005-2015 Shaun Purcell, Christopher Chang   GNU General Public License v3
# Logging to /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.log.
# 515868 MB RAM detected; reserving 257934 MB for main workspace.
# 11923 variants loaded from .bim file.
# 487409 people (223006 males, 264318 females, 85 ambiguous) loaded from .fam.
# Ambiguous sex IDs written to
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.nosex
# .
# --exclude: 11859 variants remaining.
# --remove: 487324 people remaining.
# Using 1 thread (no multithreaded calculations invoked).
# Before main variant filters, 487324 founders and 0 nonfounders present.
# Calculating allele frequencies... done.
# 11859 variants and 487324 people pass filters and QC.
# Note: No phenotypes present.
# --make-bed to
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.bed
# +
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.bim
# +
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.fam
# ... done.
# PLINK v1.90b3d 64-bit (10 Feb 2015)        https://www.cog-genomics.org/plink2
# (C) 2005-2015 Shaun Purcell, Christopher Chang   GNU General Public License v3
# Logging to /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.log.
# 515868 MB RAM detected; reserving 257934 MB for main workspace.
# 11859 variants loaded from .bim file.
# 487324 people (223006 males, 264318 females) loaded from .fam.
# --remove: 429874 people remaining.
# Using 1 thread (no multithreaded calculations invoked).
# Before main variant filters, 429874 founders and 0 nonfounders present.
# Calculating allele frequencies... done.
# 11859 variants and 429874 people pass filters and QC.
# Note: No phenotypes present.
# --make-bed to
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.bed
# +
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.bim
# +
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.fam
# ... done.

# ------------------------------------------------------------------------------------

# STEP 4 : Filter SNPs & subjects based on call rate, minor allele frequency (MAF), linkage disequilibrium (LD) and Hardy-Weinberg equilibrium (HWE)

bash ./steps_code/4_filter_and_convert.sh

# -----------------------------------EXAMPLE-OUTPUT-----------------------------------

# PLINK v1.90b3d 64-bit (10 Feb 2015)        https://www.cog-genomics.org/plink2
# (C) 2005-2015 Shaun Purcell, Christopher Chang   GNU General Public License v3
# Logging to /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.1.log.
# 515868 MB RAM detected; reserving 257934 MB for main workspace.
# 11859 variants loaded from .bim file.
# 429874 people (197261 males, 232613 females) loaded from .fam.
# 0 people removed due to missing genotype data (--mind).
# Using 1 thread (no multithreaded calculations invoked).
# Before main variant filters, 429874 founders and 0 nonfounders present.
# Calculating allele frequencies... done.
# 0 variants removed due to missing genotype data (--geno).
# 1546 variants removed due to minor allele threshold(s)
# (--maf/--max-maf/--mac/--max-mac).
# 10313 variants and 429874 people pass filters and QC.
# Note: No phenotypes present.
# --make-bed to
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.1.bed
# +
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.1.bim
# +
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.1.fam
# ... done.
# PLINK v1.90b3d 64-bit (10 Feb 2015)        https://www.cog-genomics.org/plink2
# (C) 2005-2015 Shaun Purcell, Christopher Chang   GNU General Public License v3
# Logging to /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.2.log.
# 515868 MB RAM detected; reserving 257934 MB for main workspace.
# 10313 variants loaded from .bim file.
# 429874 people (197261 males, 232613 females) loaded from .fam.
# Using 1 thread (no multithreaded calculations invoked).
# Before main variant filters, 429874 founders and 0 nonfounders present.
# Calculating allele frequencies... done.
# 10313 variants and 429874 people pass filters and QC.
# Note: No phenotypes present.
# --make-bed to
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.2.bed
# +
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.2.bim
# +
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.2.fam
# ... done.
# Pruned 9097 variants from chromosome 22, leaving 1216.
# Pruning complete.  9097 of 10313 variants removed.
# Marker lists written to
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.2.prune.in
# and
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.2.prune.out
# .
# PLINK v1.90b3d 64-bit (10 Feb 2015)        https://www.cog-genomics.org/plink2
# (C) 2005-2015 Shaun Purcell, Christopher Chang   GNU General Public License v3
# Logging to /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.2.bis.log.
# 515868 MB RAM detected; reserving 257934 MB for main workspace.
# 10313 variants loaded from .bim file.
# 429874 people (197261 males, 232613 females) loaded from .fam.
# --extract: 1216 variants remaining.
# Using 1 thread (no multithreaded calculations invoked).
# Before main variant filters, 429874 founders and 0 nonfounders present.
# Calculating allele frequencies... done.
# 1216 variants and 429874 people pass filters and QC.
# Note: No phenotypes present.
# --make-bed to
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.2.bis.bed
# +
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.2.bis.bim
# +
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.2.bis.fam
# ... done.
# PLINK v1.90b3d 64-bit (10 Feb 2015)        https://www.cog-genomics.org/plink2
# (C) 2005-2015 Shaun Purcell, Christopher Chang   GNU General Public License v3
# Logging to /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.3.log.
# 515868 MB RAM detected; reserving 257934 MB for main workspace.
# 1216 variants loaded from .bim file.
# 429874 people (197261 males, 232613 females) loaded from .fam.
# Using 1 thread (no multithreaded calculations invoked).
# Before main variant filters, 429874 founders and 0 nonfounders present.
# Calculating allele frequencies... done.
# --hwe: 75 variants removed due to Hardy-Weinberg exact test.
# 1141 variants and 429874 people pass filters and QC.
# Note: No phenotypes present.
# --make-bed to
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.3.bed
# +
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.3.bim
# +
# /links/groups/borgwardt/Data/UKBiobank/genotype_500k/EGAD00010001497/plink/c22.onlyrsids.imputed.noduplicates.filtered.3.fam
# ... done.

# ------------------------------------------------------------------------------------

# STEP 5 : Run PLINK to merge all the individual chromosome files

bash ./steps_code/5_merge_chr.sh

# -----------------------------------EXAMPLE-OUTPUT-----------------------------------



# ------------------------------------------------------------------------------------

# STEP 6 : Split into male and female

bash ./steps_code/6_split_malefemale.sh

# -----------------------------------EXAMPLE-OUTPUT-----------------------------------



# ------------------------------------------------------------------------------------

# STEP 7 : Split into train and test

bash ./steps_code/7_split_traintest.sh

# -----------------------------------EXAMPLE-OUTPUT-----------------------------------



# ------------------------------------------------------------------------------------

# STEP 8 : Extract based on phenotypes

bash ./steps_code/8_filter_phenotype.sh

# -----------------------------------EXAMPLE-OUTPUT-----------------------------------



# ------------------------------------------------------------------------------------

# STEP 9 : Convert to HDF5

bash ./steps_code/9_convert_hdf5.sh

# -----------------------------------EXAMPLE-OUTPUT-----------------------------------



# ------------------------------------------------------------------------------------

