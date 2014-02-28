# reading file using a block and omitting default 'r' argument
data = open('data/legislators.csv'){|f| f.read}
puts "#{data.length} characters"
puts data

# run:
# > ruby scripts/002-sugar-open-file.rb