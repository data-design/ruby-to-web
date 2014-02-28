# reading file using a block and omitting default 'r' argument
data = open('data/legislators.csv'){|f| f.read}

# 'w' argument MUST be specified
my_new_file = File.open('results/templegs.txt', 'w')

# write the first 101 characters and capitalize them
my_new_file.write( data[0..100].upcase )

# close the file handler. Usually not a big deal, but best practice
my_new_file.close


# run:
# > ruby scripts/003-basic-write-file.rb

# result:
# File created in results/templegs.txt that contains:
# TITLE,FIRSTNAME,MIDDLENAME,LASTNAME,NAME_SUFFIX,NICKNAME,PARTY,STATE,DISTRICT,IN_OFFICE,GENDER,PHONE,