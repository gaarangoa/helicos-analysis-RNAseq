require(edgeR)
require(gplots)

# logistic function

genome = "Ruminococcous_gauvreauii"
x=read.csv(paste(genome, '.genes.matrix.csv',sep=""),header=T)

# Add labels to matrix
colnames(x) = c('genes', 'PYG-L2',	'PYG-L1',	'PYG-D1',	'PYG-D2', 'description')
rownames(x) = paste(x$genes," (",x$description,")", sep="")

# remove gene's column
xp = x[,c(2,3,4,5,6)]
x = x[,c(2,3,4,5)]

dgList <- DGEList( x , genes=rownames(x), group = c('A','A','C','C'))

et = estimateDisp(dgList)
et = estimateCommonDisp(et)
et = estimateTagwiseDisp(et)
tss = exactTest(et, pair=c('C','A'))

gex=cbind(tss$table,xp)
write.csv(gex,file=paste(paste(genome,'.diff.csv', sep=""),sep=''))

y = as.matrix(log2(x[gex$PValue<0.005,]))
pdf(paste(genome, '.pdf', sep=''),8,16)
heatmap.2(y, tracecol='black', density="density")
dev.off()