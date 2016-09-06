class Sighting < ActiveRecord::Base
  belongs_to :animal

  validates :description, :presence => true
end
