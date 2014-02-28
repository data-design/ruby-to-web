require_relative './helper'

data = open(LEGISLATORS_FILE){|f| f.read}

# block syntax, multi-line style
open('results/templegs-2.txt', 'w') do |f|   
  rows = data.split("\n") 
  f.puts "This file has #{rows.count} rows"
  f.puts '##############'
  rows.each{|row| f.puts row.split(",")[6..10].join(" plus ") }
end

# results
# This file has 830 rows
# ##############
# party plus state plus district plus in_office plus gender
# D plus HI plus 1 plus 0 plus M
# D plus NY plus 5 plus 0 plus M
# R plus AL plus 4 plus 1 plus M
# D plus HI plus Junior Seat plus 0 plus M
# R plus CO plus Senior Seat plus 0 plus M
