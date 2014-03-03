#### Basic File writing
#
# Let's start off by reading the same legislators data file and storing it in the `data` variable
data = open('data/legislators.csv'){|f| f.read}

# The syntax for writing is similar for reading, except that the second argument is *required*
my_new_file = File.open('results/templegs.txt', 'w')
# The upshot is that if you leave off the second argument, `File.open` will assume you are trying to 
# read the file and at least you won't *overwrite* your existing file by accident.

# Write the first 101 characters and convert them to uppercase
my_new_file.write(data[0..100].upcase)

# Close the file handler. You most definitely want to do this to prevent some other
# part of your program from writing to the file unintentionally.
my_new_file.close
# In the next example, we'll use the block-form
# so that we don't have to `close` the file manually.
#
##### Output result:
# A file named `results/templegs.txt` is created and it contains:
#
#     TITLE,FIRSTNAME,MIDDLENAME,LASTNAME,NAME_SUFFIX,NICKNAME,PARTY,STATE,DISTRICT,IN_OFFICE,GENDER,PHONE,