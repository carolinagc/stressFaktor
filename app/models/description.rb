class Description < ActiveRecord::Base
  attr_accessible :descriptable_id, :descriptable_type, :address, :description, :email, :link, :name, :longitude, :latitude
  belongs_to :descriptable, :polymorphic => true
  geocoded_by :address
  validates_presence_of :name, :description

#  validates_format_of :email, :with => /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/
#  validates_format_of :link, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/
#  validates_uniqueness_of :link

 scope :locations, where(:descriptable_type => "Location")
  after_validation :geocode
  acts_as_gmappable :process_geocoding => false
  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  "#{self.address}" 
  end

  def gmaps4rails_infowindow
      # add here whatever html content you desire, it will be displayed when users clicks on the marker
    "<h5>#{name}</h5><p> #{description}</p> "

  end


end
