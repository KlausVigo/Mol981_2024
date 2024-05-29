library(phangorn)

# Session -> Set working directory -> To source file location

# We create a tree and csv file
#data(carnivora)
#frm <- ~SuperFamily/Family/Genus/Species
#tr <- as.phylo(frm, data = carnivora, collapse=FALSE)
#plot(tr, "u", show.node.label=TRUE, cex=.5, lab4ut="axial")
#write.tree(tr, "carnivora.nwk")
#write.csv(carnivora, "carnivora.csv", row.names = FALSE, quote=FALSE)

tr <- read.tree("carnivora.nwk")
plot(tr, "u", show.node.label=TRUE, cex=.5, lab4ut="axial")

carnivora <- read.csv("carnivora.csv")


head(carnivora)
summary(carnivora)
# replace space with underscore
carnivora$Species <- gsub(" ", "_", carnivora$Species)

# create a named vector with colors and names (SuperFamily or Species later on)
x <- setNames(c("red", "blue"), unique(carnivora$SuperFamily))
col <- x[carnivora$SuperFamily]
names(col) <- carnivora$Species
col[1:10]
plot(tr, "u", show.node.label=TRUE, tip.color = col[tr$tip.label], cex=.5, lab4ut="axial")

x <- setNames(c("red", "blue","yellow","green","pink","darkgreen","lightblue","purple"), unique(carnivora$Family))
col <- x[carnivora$Family]
names(col) <- carnivora$Species
plot(tr, "u", show.node.label=TRUE, tip.color = col[tr$tip.label], cex=.5, lab4ut="axial")



