class Event < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  attr_accessible :date, :description_attributes, :event_type_id, :event_type, :location_id, :organizer_id, :time, :image, :remote_image_url, :category_ids, :remove_image, :name, :start_at, :end_at
  belongs_to :organizer 
  belongs_to :location 
  belongs_to :event_type 
  has_one :description, :as => :descriptable, :dependent =>:destroy   
  has_and_belongs_to_many :categories 
  accepts_nested_attributes_for :description, :reject_if => :all_blank

  def self.search(search)
    if search
     Description.where(name: search, descriptable_type: "Event")
    else
      scoped
    end
  end

end
