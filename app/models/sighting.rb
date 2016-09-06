class Sighting < ActiveRecord::Base
  belongs_to :animal
  validates :description, :presence => true

  def self.search(date1, date2)
    where("date BETWEEN :date1 AND :date2", date1: "#{date1}", date2: "#{date2}")
  end
end
