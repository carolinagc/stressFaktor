class Organizer < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  attr_accessible  :description_attributes, :image, :remote_image_url, :remove_image
  has_many :events
  has_one :description, :as => :descriptable, :dependent =>:destroy
  delegate   :name, :address, :link, :email, :to => :description, :allow_nil => true
  accepts_nested_attributes_for :description
end
