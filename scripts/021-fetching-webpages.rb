#### Basic webpage fetching
#
# The Ruby standard library includes [OpenURI](http://www.ruby-doc.org/stdlib-2.1.0/libdoc/open-uri/rdoc/OpenURI.html), which abstracts the complexities
# of Internet file retrieval and makes opening a webpage about as easy
# as opening a file on our operating system.
require 'open-uri'

# In fact, `OpenURI` patches the `open` method to perform remote Web file access
# if the file address you give it appears to be an actual URL:
data = open('http://www.nytimes.com'){|f| f.read }
puts "#{data.length} bytes"
#   => 195741 bytes
#
# Let's compare the file sizes of new sites' HTML front pages:
news_urls = ['washingtonpost.com', 'nytimes.com', 'latimes.com', 'cnn.com', 'drudgereport.com', 'bbc.co.uk']

pages = news_urls.map do |url|
# Printing to screen so you know what's going on during program execution
  puts "Downloaded #{url}"
# if you don't specify `http://`, the `open` call will assume you're looking for a file named `'cnn.com'`
  page = open("http://#{url}"){|f| f.read }

  [url, page]
end
#
# Which has the largest bytes size?
#
pages.sort_by{|a| -a[1].length}.each do |a|
  url, page = a
  puts "#{url}: #{page.length} bytes"
end
# 
#~~~
# washingtonpost.com: 310168 bytes
# latimes.com: 269705 bytes
# nytimes.com: 195615 bytes
# cnn.com: 122280 bytes
# bbc.co.uk: 111304 bytes
# drudgereport.com: 43217 bytes
#~~~
#
# Count instances of the <img> tag:
pages.map{|a| [a[0], a[1].scan('<img').count ] }.sort_by{|a| -a[1] }.each do |a|
  puts "#{a[0]}: #{a[1]} img tags"
end
#
#~~~
# cnn.com: 104 img tags
# washingtonpost.com: 85 img tags
# nytimes.com: 71 img tags
# latimes.com: 66 img tags
# bbc.co.uk: 33 img tags
# drudgereport.com: 6 img tags
#~~~