import sys, math


file=open(sys.argv[1]).readlines()
fo=open(sys.argv[1]+".log2.normalized.csv",'w')

control=int(sys.argv[2]) # index of the control

header=file[0].replace('\n','').split(',')
hn=header[:control]+header[control+1:]

fo.write(",".join(hn)+"\n")

for i in file[1:]:
    i=i.replace("\n","").split(',')
    item=i[0]
    data=i[1:control]+i[control+1:]
    control_value=float(i[control])
    ni=[str(math.log((float(ix)+1)/(control_value+1),2)) for ix in data]
    fo.write(item+","+",".join(ni)+"\n")

fo.close()
