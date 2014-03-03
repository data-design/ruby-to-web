# Trying out sqlite3
# pre:
# at the command line, run: 
# > gem install sqlite3

require_relative './helper'
require 'csv'
require 'sqlite3'
require 'pry'

# extract the data and make an array of CSV::Row objects
data_rows = CSV.open(TWITTER_LEGISLATORS_FILE, headers: true){|c| c.entries }
headers = data_rows.first.headers

# Create the database
## start with a clean slate
db_filename = DB_FILENAME_01
db_filename.delete if db_filename.exists?
## create the database and connect to it
db = SQLite3::Database.new(db_filename)

## create the table
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
