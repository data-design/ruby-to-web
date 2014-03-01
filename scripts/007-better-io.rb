# Read line-by-line, instead of all at once
require_relative './helper'

outs = open('results/templegs-3.txt', 'w')
open(LEGISLATORS_FILE) do |indata|
  indata.readline # skip the first line
  until indata.eof? # or, more traditionally: while !(indata.eof?)
    row = indata.readline
    cols = row.split(',')

    outs.puts "#{cols[3]}, #{cols[1]}: #{cols[6..7].join('-')}"
  end
end

outs.close

# results:
# Abercrombie, Neil: D-HI
# Ackerman, Gary: D-NY
# Aderholt, Robert: R-AL
# Akaka, Daniel: D-HI
# Allard, Wayne: R-CO