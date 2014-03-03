LEGISLATORS_FILE = File.expand_path '../../data/legislators.csv', __FILE__

# after scripts/008-csv.rb
DATA_DIR = Pathname.new File.expand_path('../../data', __FILE__)
RESULTS_DIR = Pathname.new File.expand_path('../../results', __FILE__)
TWITTER_LEGISLATORS_FILE = RESULTS_DIR.join 'legislators-on-twitter.csv'

DB_FILENAME_01 = RESULT_DIR.join 'tweet-congress-011.sqlite'


#TWEET_CONGRESS_DB_NAME = File.expand_path '../../results/tweet-congress.sqlite', __FILE__
#TWEET_CONGRESS_HEADERS = ['title', 'firstname', 'lastname', 'party', 'state', 'district', 'bioguide_id', 'birthdate', 'twitter_id']
