class Location < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  attr_accessible :capacity, :description_attributes, :image, :remote_image_url, :remove_image
  has_many :events
  has_one :description, :as => :descriptable, :dependent =>:destroy 
#  before_create :ensure_presence_of_description
  delegate   :name, :address, :link, :email, :to => :description, :allow_nil => true
  accepts_nested_attributes_for :description


 protected

  def ensure_presence_of_description
    description = Description.create unless description.present?
  end

  def gmaps4rails_infowindow
      # add here whatever html content you desire, it will be displayed when users clicks on the marker
    "<h5>#{name}</h5><p> #{description}</p> <p>#{Event.all.map(&:location)}</p> "

  end



end
