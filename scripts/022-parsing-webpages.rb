#### Parsing webpages with Nokogiri
#
# First, install the [Nokogiri gem](http://nokogiri.org/):
#
#     
#     gem install nokogiri
#
require 'nokogiri'
require 'open-uri'
# Instead of parsing webpages with string matching, Nokogiri takes advantage
# of HTML's underlying structure.
#
# Download a webpage just like in the previous lesson:
#
url = 'http://en.wikipedia.org/wiki'
page = open(url){|f| f.read}

# Parse it with Nokogiri
#
npage = Nokogiri::HTML(page)
# Count the number of <img> tags:
#
imgs = npage.search('img')
puts "#{imgs.count} images"
#
#
# Download each image and count the bytes:
bytes = 0
imgs.each do |img|
  # each image URL is relative to the page, e.g. `//upload.wikimedia.org/photo.jpg` so we
  # need to resolve the absolute address
  src = URI.join 'http://en.wikipedia.org', img['src']

  puts "Downloading #{src}"
  # specify `rb` to indicate that we are reading binary
  imgfile = open(src, 'rb'){|f| f.read}
  puts "... #{imgfile.length} bytes"

  bytes += imgfile.length
end

puts "There are #{bytes} bytes for the  #{imgs.count} images on #{url}"
#
#~~~
# Downloading http://upload.wikimedia.org/wikipedia/en/f/f2/Wiktionary-logo-51px.png
# ... 478 bytes
# Downloading http://en.wikipedia.org/wiki/Special:CentralAutoLogin/start?type=1x1
# ... 90 bytes
# Downloading http://bits.wikimedia.org/images/wikimedia-button.png
# ... 2426 bytes
# Downloading http://bits.wikimedia.org/static-1.23wmf15/skins/common/images/poweredby_mediawiki_88x31.png
# ... 3525 bytes
# There are 71743 bytes for the  20 images on http://en.wikipedia.org/wiki
#~~~