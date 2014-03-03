#### 
# reading file using a block and omitting default 'r' argument
data = open('data/legislators.csv'){|f| f.read}

# block syntax
open('results/templegs.txt', 'w'){ |f| f.write data[0..100].upcase }