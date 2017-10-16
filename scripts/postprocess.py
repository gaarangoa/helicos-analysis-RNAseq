import sys
import os

metadata = sys.argv[1]
pathd = sys.argv[2]
scripts = sys.argv[3]

M = {}
for i in open(metadata):
    i = i.split()
    try:
        M[i[1]].append(pathd+"/"+i[2]+".uc.genes")
    except:
        M[i[1]] = [pathd+"/"+i[2]+".uc.genes"]

for i in M:
    os.system( "cat " + " ".join(M[i]) + " > "+ pathd + "/" + i + ".genes")
    os.system( "python "+ scripts + "/process_genes.py " + pathd + "/" + i + ".genes")
