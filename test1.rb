require 'rubygems'
require 'nokogiri'

#if HTML page on computer
page = Nokogiri::HTML(open("index1.html"))
puts page.class   # => Nokogiri::HTML::Document
#The Nokogiri::HTML construct takes in the opened file's contents and wraps it in a special Nokogiri data object.
