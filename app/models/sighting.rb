class Sighting < ActiveRecord::Base
  belongs_to :animal

  validates :description, :presence => true
  validates :date, :presence => true
  validates :latitude, :presence => true
  validates :longitude, :presence => true
end
