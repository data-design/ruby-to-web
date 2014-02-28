# Read line-by-line, instead of all at once
require_relative './helper'

outs = open('results/templegs-3.txt', 'w')
open(LEGISLATORS_FILE) do |indata|
  until indata.eof? # or, more traditionally: while !(indata.eof?)
    row = indata.readline
    outs.puts row.split(",")[0..3].reverse.join('|').upcase
  end
end

outs.close

# results:
# LASTNAME|MIDDLENAME|FIRSTNAME|TITLE
# ABERCROMBIE||NEIL|REP
# ACKERMAN|L.|GARY|REP
# ADERHOLT|B.|ROBERT|REP
# AKAKA|KAHIKINA|DANIEL|SEN
