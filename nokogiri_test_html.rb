require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://www.stressfaktor.squat.net/adressen"
doc = Nokogiri::HTML(open(url))

doc.css("span.text2").each do |item|

  name = item.xpath("b").text
  a = item.xpath("text()[1]").text
  if !a.empty? && a.match("Berlin")
      #/[0-9]*\s\S*$/.match("Berlin")
   puts "Address: "+a
  end 
  email = item.css('a[@href ^="mailto:"]')
  link = item.css('a[@href ^="http:"]')

puts email

end

