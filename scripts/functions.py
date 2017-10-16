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
