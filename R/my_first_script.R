1+1
# assign 1 to x
x <- 1
y <- "2"

# 
class(x)
class(y)

# Vectors
z <- c(1,2,3,2,1)
# Subsetting
z[1]
z[3]
z[-4]
z[3:1]
# logical subsetting
z[z>1]
# all elements in a vector must have the same mode
c(1,2,x)
c(1, 2, "a")
c(1, 2, TRUE, FALSE, -1)

A <- matrix(0, nrow=5, ncol=3)
A[2:3,3] <- 2   

a <- x

df <- data.frame(x=1:5, y=rnorm(5, mean=10), z=z, 
                 letters=factor(c("A","B","A","B","A")))
plot(df$x, df$y)


#Getting help
?rnorm
rnorm(10)
set.seed(42) # setting random seed
rnorm(10)


# R packages
library(phangorn)

data("Laurasiatherian")
# show the alignment
image(Laurasiatherian)
image(Laurasiatherian[1:10, 1:100])

tree_mp <- pratchet(Laurasiatherian)  
tree_mp <- acctran(tree_mp, Laurasiatherian)
plot(tree_mp)
?plot.phylo

write.tree(tree_mp)
tree <- read.tree("MP_tree.phy")
all.equal(tree, tree_mp)
par(mar=c(1,1,1,1))
plot(tree, "f", cex=.4)

