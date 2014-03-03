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



