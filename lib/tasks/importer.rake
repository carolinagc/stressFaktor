require 'open-uri'

namespace :importer do
  desc 'import data from website'
  task :import => :environment do
    doc = Nokogiri::HTML(open('http://stressfaktor.squat.net/rss.php'))
    doc.search('//item').each do |item|
      name            = item.children.first.text.strip.match(/.*\d\s(.+)\s\(.*/)[1]
      event_type_name = item.children.first.text.strip.match(/(\d+.+\d)(.+?)([\(])/)[2]
      time            = Time.parse(item.children.first.text.strip.match(/([\d\:]{5})/)[1])
      date            = Date.parse(item.children.first.text.strip.match(/([\d\.]{5})/)[1].to_s+".#{Date.today.year.to_s}")
      location_name   = item.children.first.text.strip.match(/\(([^\(\)]+)\)/)[1]
      description     = item.children[1].text.strip
      link            = item.children[3].text


      event = Event.create(:date => date.strftime('%d-%m-%Y'), :time => time.strftime('%H:%Mh'))
      event.create_description(:name => name, :description => description, :link => link)
      event.event_type = EventType.find_or_create_by_name event_type_name

      if description = Description.locations.where(:name => location_name).first
        event.location = description.descriptable
      else
        event.create_location
        event.location.create_description(:address => 'Berlin',
                                          :name => location_name,
                                          :description => 'n/a',
                                          :email => 'n/a',
                                          :link => 'http://www.stressfaktor.squat.net')
      end
      event.save
    end
  end
end