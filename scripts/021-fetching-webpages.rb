#### Basic webpage fetching
#
# The Ruby standard library includes [OpenURI](http://www.ruby-doc.org/stdlib-2.1.0/libdoc/open-uri/rdoc/OpenURI.html), which abstracts the complexities
# of Internet file retrieval and makes opening a webpage about as easy
# as opening a file on our operating system.
require 'open-uri'

# In fact, `OpenURI` patches the `open` method to perform remote Web file access
# if the file address you give it appears to be an actual URL:
data = open('http://www.nytimes.com'){|f| f.read }
puts data.length
#   => 
