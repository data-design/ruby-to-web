<<<<<<< HEAD
#### Data retrieval with SQLite
require_relative './helper'
require 'csv'
require 'sqlite3'

# Assuming the previous script was run and the database
# with this particular filename has been created and populated:
db_filename = DB_FILENAME_01
db = SQLite3::Database.new(db_filename)

# **Perform a simple select statement**
query = 



#### Let's query our database
# Prereqs: In our `helper.rb` file, we now have a constant set up like so:
# 
# We use `open`, which is a *class* method of the `File` class 
# and pass in two `String` arguments:
#
# 1. The file path
# 2. The *mode*, in this case `'r'`
