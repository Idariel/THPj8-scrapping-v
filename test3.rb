require 'rubygems'
require 'nokogiri'
require 'rest-client' #ne pas oublier d'installer la gem (install gem rest-client)

# page = Nokogiri::HTML(RestClient.get("https://en.wikipedia.org/"))
# puts page.class   # => Nokogiri::HTML::Document# page =
page2 = Nokogiri::HTML(RestClient.get("http://www.isalechat.fr/"))
puts page2.class   # => Nokogiri::HTML::Document# page =
