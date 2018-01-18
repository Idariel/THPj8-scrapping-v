require 'rubygems'
require 'nokogiri'
require 'open-uri'

#If the webpage is live on a remote site, like http://en.wikipedia.org/, then you'll want to include the open-uri module, which is part of the standard Ruby distribution but must be explicitly required:

page = Nokogiri::HTML(open("https://en.wikipedia.org/"))
puts page.class   # => Nokogiri::HTML::Document
page2 = Nokogiri::HTML(open("http://www.isalechat.fr/"))
puts page2.class   # => Nokogiri::HTML::Document
#What open-uri does for us is encapsulate all the work of making a HTTP request into the open method, making the operation as simple as as opening a file on our own hard drive.
