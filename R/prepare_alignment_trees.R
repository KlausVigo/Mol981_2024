library(phangorn)
# read alignment and table
info <- read.csv("aaSpeciesNames.csv")
aa <- read.phyDat("MAFFT_aa_LPMO.FASTA", format="fasta", type="AA")
head(info)

aa_names <- names(aa)
?grep

# change long names to accession number in vector aa_names
# our first loop
for(i in info$AccessionNumber){
  pos <- grep(i, aa_names)
  aa_names[pos] <- i
}

# assign accession number to the aa object
names(aa) <- aa_names

# export asta file with accession number
write.phyDat(aa, "LPMO_AA_MAFFT.fasta", format="fasta")


info_nt <- read.csv("ntSpeciesNames.csv")
dna <- read.phyDat("MAFFT_nt_LPMO_31.fasta", format="fasta", type="DNA")
head(info_nt)

dna_names <- names(dna)
?grep

# change long names to accession number in vector aa_names
# our first loop
for(i in info_nt$AccessionNumber){
  pos <- grep(i, dna_names)
  dna_names[pos] <- i
}

# assign accession number to the aa object
names(dna) <- dna_names

# export asta file with accession number
write.phyDat(dna, "LPMO_NT_MAFFT_SN.fasta", format="fasta")



tree_mp <- pratchet(aa)
tree_mp <- acctran(tree_mp, aa)
tree_mp <- midpoint(tree_mp)
# 	A. logei as outgroup
tree_outgroup <- root(tree_mp, "WP_065612261.1")
tree_outgroup_nolabels <- tree_outgroup
tree_outgroup_nolabels$node.label <- NULL
tree_outgroup_wlabel <-   makeNodeLabel(tree_outgroup, prefix="N")
write.tree(tree_outgroup_nolabels)

plot(tree_outgroup)
plot(tree_mp)




