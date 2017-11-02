require(edgeR)
require(gplots)

# logistic function

genome = "Bifidobacterium_catenulatum"
x=read.csv(paste(genome, '.genes.matrix.csv',sep=""),header=T)

# Add labels to matrix
# colnames(x) = c('genes', 'BDM-D2',	'PYG-L1',	'PYG-D1',	'PYG-D2', 'description')
rownames(x) = paste(x$samples," (",x$description,")", sep="")

# remove gene's column
xp = x[,c(2,3,4,5,6)]
x = x[,c(2,3,4,5)]

dgList <- DGEList( x , genes=rownames(x), group = c('C','C','A','A'))

et = estimateDisp(dgList)
et = estimateCommonDisp(et)
et = estimateTagwiseDisp(et)
tss = exactTest(et, pair=c('C','A'))

gex=cbind(tss$table,xp)
write.csv(gex,file=paste(paste(genome,'.diff-LH_L.csv', sep=""),sep=''))

y = as.matrix(log2(x[gex$PValue<0.05,]))
pdf(paste(genome, '.LH_L.pdf', sep=''),8,16)
heatmap.2(y, tracecol='black', density="density")
dev.off()