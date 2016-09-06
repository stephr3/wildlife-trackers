class CreateSightings < ActiveRecord::Migration[5.0]
  def change
    create_table :sightings do |t|
      t.column :description, :string
      t.column :date, :date
      t.column :latitude, :float
      t.column :longitude, :float

      t.timestamps
    end
  end
end
