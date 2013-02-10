require 'open-uri'

namespace :location do
  desc 'import locations from website'
  task :import => :environment do

  url = "http://www.stressfaktor.squat.net/adressen"
  doc = Nokogiri::HTML(open(url))

  doc.css('table[bgcolor="#000000"]').each do |item|
    name = item.css("span.text2 b").text
    address = item.xpath("tr[1]/td/span")
    a = address.xpath("text()[1]").text
    description = item.xpath("tr[2]/td/span").text
    email = item.css('a[@href ^="mailto:"]').to_s.match(/[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})/)
    link = item.css('a[@href ^="http:"]').to_s.match(/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?/)
puts "NAME " + name.to_s
   if !name.empty?
        location = Location.new
        location.create_description(:address => a,
                                          :name => name,
                                          :email => email.to_s,
                                          :link => link.to_s,
                                          :description => description)
        location.save
   end

   end
 end
end
