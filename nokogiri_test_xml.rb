require 'rubygems'
require 'nokogiri'
require 'open-uri'

#url = "http://www.stressfaktor.squat.net/adressen"
#doc = Nokogiri::HTML(open(url))


url = "http://www.stressfaktor.squat.net/rss"
doc = Nokogiri::XML(open(url))

items= doc.xpath("//item")

#doc.xpath("//item").each do |item|
#  puts item
  title = items.xpath("//title").text
#  puts "title" + title
  description = item.xpath("//description").text
#puts "description" + description
#end


#date = title.text[/^\S*\s\d\S*/]
#puts date
