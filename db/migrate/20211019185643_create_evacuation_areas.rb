class CreateEvacuationAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :evacuation_areas do |t|
      t.string :name
      t.string :latlong

      t.timestamps
    end
  end
end
