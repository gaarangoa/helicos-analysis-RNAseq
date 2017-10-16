#!/usr/bin/python

import networkx as nx

def v2m(X,filter,index, minA): # from a vector value,x,y create an square matrix
    A={}
    x=[]
    y=[]
    A=nx.DiGraph()
    for i in X:
        A.add_edge(i[0],i[1],A=i[index+2])
        x.append(i[0])
        y.append(i[1])
    x=list(set(x))
    y=list(set(y))
    print "graph created"
    B=[["samples"]+y]
    N=[["samples"]+y]
    edges=A.edges()
    #print len(edges)
    for ix in x:
        item=[ix]
        for iy in y:
            try:
                value=A[ix][iy]["A"]
                item.append(value)
            except:
                item.append(0)
        B.append(item)
    print "matrix created"
    return B


import sys
file=sys.argv[1]
x,y,z=int(sys.argv[2]),int(sys.argv[3]),int(sys.argv[4])

X=open(file).readlines()
X=[i.replace("\n","").replace(",","_").split("\t") for i in open(file).readlines()]
X=[[i[x],i[y],i[z]] for i in X]


N=v2m(X,0,0,0)

fo=open(file+".matrix.csv","w")

for i in N:
    fo.write(",".join([str(x) for x in i])+"\n")

fo.close()








#
