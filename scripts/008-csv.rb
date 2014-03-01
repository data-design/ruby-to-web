# Use the CSV standard library
require_relative './helper'
require 'csv'

column_headers = ['title', 'firstname', 'lastname', 'party', 'state', 'district', 'bioguide_id', 'birthdate', 'twitter_id']

# http://www.ruby-doc.org/stdlib-2.0/libdoc/csv/rdoc/CSV.html
new_csv = CSV.open('results/legislators-on-twitter.csv', 'wb', headers: true)
new_csv << column_headers


CSV.foreach(LEGISLATORS_FILE, headers: true) do |row|
  # create a new row with just the columns we want
  new_row = column_headers.reduce({}) do |x_row, h|
    x_row[h] = row[h]

    x_row
  end

  # exclude non-Twitter users
  new_csv << new_row unless new_row['twitter_id'].nil?
end