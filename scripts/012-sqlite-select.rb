#### Data retrieval with SQLite
require_relative './helper'
require 'csv'
require 'sqlite3'

# Assuming the previous script was run and the database
# with this particular filename has been created and populated:
db_filename = TWEET_CONGRESS_DB_NAME
db = SQLite3::Database.new(db_filename.to_s)
# By default, the sqlite3 gem returns query results as arrays. Hashes are easier to work with so
# we set `:results_as_hash` to `true` 
db.results_as_hash = true

##### Perform a simple select statement
query = "SELECT * from congressmembers"
results = db.execute(query)

puts results.first
#
#  each entry in `results` looks like:
#
#~~~ruby
# {"title"=>"Rep", "firstname"=>"Robert", "lastname"=>"Aderholt", "party"=>"R", 
#  "state"=>"AL", "district"=>"4", "bioguide_id"=>"A000055", "birthdate"=>"1965-07-22", 
#  "twitter_id"=>"Robert_Aderholt", 0=>"Rep", 1=>"Robert", 2=>"Aderholt", 3=>"R", 4=>"AL", 
#   5=>"4", 6=>"A000055", 7=>"1965-07-22", 8=>"Robert_Aderholt"}
#~~~
#
# Select all Republicans from Texas
query = "SELECT * FROM congressmembers WHERE state=? AND party=?"
results = db.execute(query, 'TX', 'R')
puts results.count
# => 25
#
results.each do |row|
  puts [row["title"], row["firstname"], row["lastname"], row["district"]].join(' ')
end
#
#~~~
# Rep Joe Barton 6
# Rep Kevin Brady 8
# Rep Michael Burgess 26
# Rep John Culberson 7
# Rep John Carter 31
# Sen John Cornyn Senior Seat
# Rep K. Conaway 11
# Sen Ted Cruz Junior Seat
# Rep Blake Farenthold 27
# Rep Bill Flores 17
# Rep Kay Granger 12
# Rep Louie Gohmert 1
# Rep Jeb Hensarling 5
# Rep Sam Johnson 3
# Rep Michael McCaul 10
# Rep Kenny Marchant 24
# Rep Randy Neugebauer 19
# Rep Pete Olson 22
# Rep Ted Poe 2
# Rep Pete Sessions 32
# Rep Lamar Smith 21
# Rep Steve Stockman 36
# Rep Mac Thornberry 13
# Rep Randy Weber 14
# Rep Roger Williams 25
~~~