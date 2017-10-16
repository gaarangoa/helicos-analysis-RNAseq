from functions import v2m
import sys

file=sys.argv[1]
GN=[i.replace("\n","").split("\t") for i in open(file).readlines()]

gene_desc={ i[0]:i[2] for i in GN}
gene_desc['samples']='description'

Mlist=[[i[0],i[4],float(i[1])] for i in GN]
print Mlist[0]
N=v2m(Mlist,0,0,0)

fo=open(file+".matrix.csv","w")

for i in N:
    fo.write(",".join([str(x) for x in i])+","+gene_desc[i[0]].replace(",","_")+"\n")

fo.close()
