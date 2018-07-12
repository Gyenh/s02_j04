require 'nokogiri'
require 'pry'
require 'rubocop'
require 'open-uri'



page = Nokogiri::HTML(open("http://google.com"))
news_links = page.css("a").select{|link| link['data-category'] == "news"}
news_links.each{|link| puts link['href'] }

#=>   http://reddit.com
#=>   http://www.nytimes.com
         
puts news_links.class   #=>   Array    

# page = Nokogiri::HTML(open("http://google.fr"))
# links = page.css("a")
# puts links.length   # => 6
# puts links[0].text   # => Click here
# puts links[0]["href"] # => http://www.google.com



# page = Nokogiri::HTML(open("http://google.fr/"))   
# 
# puts page.css("title")[0].text
# 
# 
# 
# def google

#  set URL to point to where the page exists
#  page = Nokogiri::HTML(open("http://www.google.com"))
#  links = page.css("a")
#  puts links.length   # => 6
#  puts links[0].text   # => Click here
#  puts links[0]["href"] # => http://www.google.com

# links.each do |s|
#  puts s


# end


# end