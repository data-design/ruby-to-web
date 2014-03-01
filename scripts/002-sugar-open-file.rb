#### Idiomatic file opening

# In practice, the `open` method can be invoked without referring to the
# `File` class: by default, the Ruby interpreter will assume that the first
# argument is a file class.
open('data/legislators.csv') do |file|
# Now that we're using the block-style of `open`, we are given, i.e. *yielded*
# the `File` object that we would' have had to manually assign to a variable
# as in the previous example:
# 
#     file = open('data/legisators.csv')
#
# Thus we can jump to the `read` operation
  data = file.read
  puts "#{data.length} characters"
end
# As a bonus, when we reach the end of the block, the `File` instance is
# automatically closed, which is why you rarely see `file.close` in most
# Ruby scripts.

# If all we were doing is printing out the number of characters, we could
# get it all done in one line:
#
#     open('data/legislators.csv') do |f|
#        puts "#{f.read.length} characters"
#     end
# 
# For one liners, the preferred notation is curly braces:
#
#     open('data/legislators.csv'){|f| puts "#{f.read.length} characters" } 
#
# Note: We can give the yielded `File` instance any name we want, in this case, `f`.