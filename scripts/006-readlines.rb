require_relative './helper'
# #readlines handles the different newline encodings across systems
rows = open(LEGISLATORS_FILE){|f| f.readlines }

open('results/templegs-2.txt', 'w') do |f|   
  f.puts "This file has #{rows.count} rows"
  f.puts '##############'
  rows.each{|row| f.puts row.split(",")[6..10].join(" plus ") }
end
