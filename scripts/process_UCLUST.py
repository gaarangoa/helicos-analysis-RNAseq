from urllib import urlopen
import sys
from Bio import SeqIO
import math


species=sys.argv[4]
sample_name=sys.argv[3]
file=sys.argv[1]
genome_file=sys.argv[2]

genome=SeqIO.read(genome_file,'genbank')
feat=genome.features

GENOME={}
xi=0
for i in range(1,len(feat)):
    #print xi
    xi+=1
    try:
        id=feat[i].qualifiers['locus_tag'][0]
        GENOME[id]=feat[i].qualifiers
    except:
        GENOME['unknown']={'product':'unknown'}


genome_info=feat[0].qualifiers

data=[]
k=1
fo=open(file+".INFO","w")
mapped_reads=0
total_reads=0
for i in open(file):
    total_reads+=1
    i=i.replace("\n","").split("\t")
    if not "H" in i[0]: continue;
    if i[0]=="#": continue
    try:
        gene_id=i[-1].split("locus_tag=")[1].split("]")[0]
        gene_length=i[9].split("[location=complement(")[1].replace(")]","").split("..")
        gene_length=int(gene_length[1])-int(gene_length[0])
    except:
        continue;
    #print i
    try:
        fo.write("\t".join([gene_id]+i+[str(gene_length)]+GENOME[gene_id]['product'])+"\n")
    except:
        fo.write("\t".join([gene_id]+i+[str(gene_length)]+['unknown'])+"\n")
    mapped_reads+=1
    k+=1

fo.close()


data={}
for i in open(file+".INFO"):
    i=i.replace("\n","").split("\t")
    gene_id=i[0]
    try:
        data[gene_id]['counts']+=1
        data[gene_id]['identity']+=float(i[4])
    except:
        data[gene_id]={'counts':1, 'description':i[-1], 'identity':float(i[4]), 'gene_length':int(i[-2])}


fo = open(file+".genes","w")

for i in data:
    #print data[i]['counts'], float(data[i]['gene_length'])/1000, float(mapped_reads)/1000000
    rpkm=float(data[i]['counts']/(float(data[i]['gene_length'])/1000))/(float(mapped_reads)/1000000)
    # output: gene_id | rpkm | function | average identity | sample name | bacteria name 
    fo.write(i+"\t"+str(rpkm)+"\t"+data[i]["description"]+"\t"+str(float(data[i]['identity'])/float(data[i]['counts']))+"\t"+sample_name+"\t"+species+"\n")

fo.close()

# functions

data={}
for i in open(file+".genes"):
    i=i.strip().split("\t")
    gene_id=i[2]
    try:
        data[gene_id]['counts']+=float(i[1])
    except:
        data[gene_id]={'counts':float(i[1])}


fo = open(file+".functions","w")

for i in data:
    fo.write(str(data[i]['counts']+1)+"\t"+i+"\t"+sample_name+"\t"+species+"\n")

fo.close()




#
