# basic, verbose usage
file = File.open('data/legislators.csv', 'r')

# `file` is the name we've given to the File object
# `data` actually contains the contents of that file
data = file.read

puts "#{data.length} characters"

# output the entire thing to screen
puts data

# close the file handler. Usually not a big deal, but best practice
file.close


# run:
# > ruby scripts/001-basic-open-file.rb
# => 221224 characters

