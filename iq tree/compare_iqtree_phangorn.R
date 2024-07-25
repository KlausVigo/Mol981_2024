iqtree2 -s LPMO_AA_MAFFT-1.fasta -m WAG -asr --prefix WAG_AA
iqtree2 -s LPMO_AA_MAFFT-1.fasta -m WAG+G+I -asr --prefix WAG_AA_GI


library(phangorn)

LPMO <- read.phyDat("LPMO_AA_MAFFT-1.fasta", format="fasta",
                    type="AA")
tree_iqtree_WAG <- read.tree("WAG_AA_GI.treefile")
tab <- read.table('WAG_AA.state',header=TRUE)




fit_WAG <- pml_bb(LPMO, model="WAG", rearrangement = "NNI", start=tree_iqtree_WAG)
anc_phangorn_WAG <- ancestral.pml(fit_WAG)

image(LPMO[, 1:50], scheme="Clustal", show.aa=TRUE)


LPMO_2 <- ltg2amb(LPMO)
image(LPMO_2[, 1:50], scheme="Clustal", show.aa=TRUE)

anc_iqtree_WAG <- ancestral(tree_iqtree_WAG, LPMO, tab)

plotAnc(anc_phangorn_WAG ,i=44,  type="u", use.edge=FALSE,
        scheme="Clustal", lab4ut = "axial")


plotAnc(anc_phangorn_WAG , type="u", use.edge=FALSE, lab4ut = "axial")


plotAnc(anc_iqtree_WAG )

plotAnc(anc_phangorn_WAG , 35, type="u", scheme = "Clustal", cex.pie = 0.25, cex=.5, use.edge.length=F)
plotAnc(anc_iqtree_WAG , 35, type="u", scheme = "Clustal", cex.pie = 0.25, cex=.5, use.edge.length=F)
