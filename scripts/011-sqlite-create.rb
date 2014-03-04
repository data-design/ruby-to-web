#### Creating a database in SQLite3
# 
# In our `helper.rb`, we'll set a new constant:
#
#      TWEET_CONGRESS_DB_NAME = File.expand_path '../../results/tweet-congress.sqlite', __FILE__
#
###### Install the sqlite3 gem
#
# At the command line, run: 
#
#      gem install sqlite3

require_relative './helper'
require 'csv'
require 'sqlite3'
require 'pry'

# extract the data and make an array of CSV::Row objects
data_rows = CSV.open(TWITTER_LEGISLATORS_FILE, headers: true){|c| c.entries }
# Store the column headers in a separate array
headers = data_rows.first.headers

# Create the database
## start with a clean slate
db_filename = TWEET_CONGRESS_DB_NAME
File.delete(db_filename) if File.exists?(db_filename)
# Create the database and get a connection to it
db = SQLite3::Database.new(db_filename.to_s)

## Now create the table 
query = "CREATE TABLE congressmembers(#{headers.join(', ')})"
puts "\nQuery: " +  query # just to see what's going on
db.execute(query)

## set the standard insertion query
insert_query = "INSERT INTO congressmembers VALUES(#{headers.map{'?'}.join(',')})"
puts "\ninsertion query: " +  insert_query

## iterate the rows
data_rows.each do |row|
  hsh = row.to_hash
  puts "Inserting: " + hsh.values.join(',')
  db.execute(insert_query, hsh.values)
end
