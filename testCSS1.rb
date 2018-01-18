
#Nokogiri's css method allows us to target individual or groups of HTHML methods using CSS selectors. No worries if you're not an expert on CSS. It's enough to recognize the basic syntax.

require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = "http://ruby.bastardsbook.com/files/hello-webpage.html"
# PAGE_URL = "http://www.isalechat.fr/index.htm"

# Selecting an element
# Simply pass the name of the element you want into the Nokogiri document object's css method:

page = Nokogiri::HTML(open(PAGE_URL))

puts page.css("title")[0].name   # => title
puts page.css("title")[0].text   # => My webpage
#va chercher le contenu (("title")[0].text) de l'élément <title> (("title")[0].name)

# The css method does not return the text of the target element, i.e. "My webpage". It returns an array – more specifically, a Nokogiri data object that is a collectino of Nokogiri::XML::Element objects. These Element objects have a variety of methods, including text, which does return the text contained in the element:

# Get an attribute of an element
# One of the most common web-scraping tasks is extracting URL's from links, i.e. anchor tags: <a>. The attributes of an element are provided in Hash form:


# set URL to point to where the page exists
links = page.css("a")
puts links.length   # => 6
puts links[0].text   # => Click here
puts links[0]["href"] # => http://www.google.com


# Limiting selectors
# You may not want all the links on a given page, especially if many of those links are just sidebar navigation links.
# Using select for a collection
# In some cases, this can be done with combining the Nokogiri parser results with the Enumerable select method.
# If you noticed in the sample HTML code, there are two anchor tags with class attributes equal to "news". This is how we would use select to grab only those:

news_links = page.css("a").select{|link| link['data-category'] == "news"}
news_links.each{|link| puts link['href'] }
#=>   http://reddit.com
#=>   http://www.nytimes.com
puts news_links.class   #=>   Array


# Select elements by attributes
# So select works. But the ideal solution is to not have Nokogiri's css method pull in unwanted elements in the first place. And that requires a little more knowledge of CSS selectors.
# For the above example, we can use CSS selectors to specify attribute values. I won't go into detail here, but suffice to say, it requires a tad more memorization on your part:

news_links = page.css("a[data-category=news]")
news_links.each{|link| puts link['href']}
#=>   http://reddit.com
#=>   http://www.nytimes.com

puts news_links.class   #=>   Nokogiri::XML::NodeSet

# The last line above demonstrates one advantage of doing the filtering with the css method and CSS selectors rather than Array.select: you don't have to convert the Nokogiri NodeSet object into an Array. Keeping it as a NodeSet allows you to keep doing...well...more NodeSet-specific methods. The following code calls css twice – once to gather the anchor links and then to gather any bolded elements (which use the <strong> tag) that are within those links:

page.css('p').css("a[data-category=news]").css("strong")
# Again, this will only target <strong> elements within <a> tags that have an attribute data-category set to "news" (whew, that was a mouthful). Any other <strong> elements that aren't children of such anchor tags won't be selected.

# The id and class attributes
# In our sample HTML, there are two div tags, each with its own id attribute.
# The class and id attributes are the most common way of specifying individual and groups of elements. There's nothing inherently special about them, they're just commonly-accepted attributes that web designers use to label HTML elements.
#
# id
#     Only one element on a page should have a given id attribute (though this rule is broken all the time). The CSS selector used to refer to the name of an id is:
#     #the_id_name_here
#
# class
#     The main difference between id and class is that many elements can have the same class. The CSS selector to select all elements of a given class is:
#     .the_classname_here

# Nested elements
# Rather than call css twice, as in this example:
# page.css('p').css("a").css("strong")
# You can refer to nested elements with a single CSS selector:
# page.css('p').css("a strong")
#
# To specify elements within another element, separate the element names with a space. For example, the following selector would select all image tags that are within anchor tags:
# a img
#
# To select all image tags within anchor tags that themselves are within div tags, you would do this:
# div a img
#
# In the sample below, I've bolded which elements the above selector would grab:
# <p><a href="http://mysite.com">My Site</a></p>
# <div>
#    <img src="images/picture1.jpg" alt="Image 1"/>
#    <a href="http://images.google.com"><img src="images/picture2.jpg" alt="img 2"/></a>
#    <img src="images/pic5.jpg" alt="img5">
#    <a href="http://images.yahoo.com"><img src="images/picture9.jpg" alt="img 9"/></a>
# </div>
# <a href="http://images.bing.com"><img src="images/picture11.jpg" alt="img 11"/></a>














# PAGE SCRAPPÉE
# <html>
#    <head><title>My webpage</title></head>
#    <body>
#    <h1>Hello Webpage!</h1>
#    <div id="references">
#       <p><a href="http://www.google.com">Click here</a> to go to the search engine Google</p>
#       <p>Or you can <a href="http://www.bing.com">click here to go</a> to Microsoft Bing.</p>
#       <p>Don't want to learn Ruby? Then give <a href="http://learnpythonthehardway.org/">Zed Shaw's Learn Python the Hard Way</a> a try</p>
#    </div>
#
#    <div id="funstuff">
#       <p>Here are some entertaining links:</p>
#       <ul>
#          <li><a href="http://youtube.com">YouTube</a></li>
#          <li><a data-category="news" href="http://reddit.com">Reddit</a></li>
#          <li><a href="http://kathack.com/">Kathack</a></li>
#          <li><a data-category="news" href="http://www.nytimes.com">New York Times</a></li>
#       </ul>
#    </div>
#
#    <p>Thank you for reading my webpage!</p>
#
#    </body>
# </html>
