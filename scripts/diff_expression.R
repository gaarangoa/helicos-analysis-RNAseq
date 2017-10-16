require(edgeR)

x=read.csv('Enterococcus_caccae.genes.matrix.csv',header=T)

# Add labels to matrix
colnames(x) = c('genes', 'A1', 'C2', 'C1', 'A2', 'description')
rownames(x) = paste(x$genes," (",x$description,")", sep="")

# remove gene's column
xp = x[,c(2,5,4,3,6)]
x = x[,c(2,5,4,3)]

dgList <- DGEList( x , genes=rownames(x), group = c('A','A','C','C'))

# # Experiment/Control
# sampleType = c('E', 'E', 'C', 'C')
# sampleReplicate = c('S1', 'S2', 'S1', 'S2')

# designMat <- model.matrix(~sampleReplicate + sampleType)

# dgList <- estimateGLMCommonDisp(dgList, design=designMat)
# dgList <- estimateGLMTrendedDisp(dgList, design=designMat)
# dgList <- estimateGLMTagwiseDisp(dgList, design=designMat)

# # diff expression
# fit <- glmFit(dgList, designMat)
# lrt <- glmLRT(fit, coef=3)

# gox = topTags(lrt, 5000)
# write.csv(gox,file=paste("Enterococcus_caccae.gox",'.csv',sep=''))

# gex=cbind(lrt$table,xp)
# write.csv(gex,file=paste("Enterococcus_caccae.2",'.diff.csv',sep=''))

et = estimateDisp(dgList)
et = estimateCommonDisp(et)
et = estimateTagwiseDisp(et)
tss = exactTest(et, pair=c('C','A'))

gex=cbind(tss$table,xp)
write.csv(gex,file=paste("Enterococcus_caccae.2",'.diff.csv',sep=''))

y = as.matrix(log2(x[gex$PValue<0.005,]))
pdf('heatmap.pdf',8,16)
heatmap.2(y, tracecol='black', density="density")
dev.off()