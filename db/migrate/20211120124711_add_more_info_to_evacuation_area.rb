class AddMoreInfoToEvacuationArea < ActiveRecord::Migration[6.0]
  def change
    add_column :evacuation_areas, :barangay_id, :integer
    add_column :evacuation_areas, :total_evacuation_center, :integer
    add_column :evacuation_areas, :exact_location, :string
    add_column :evacuation_areas, :proximity, :decimal, precision: 8, scale: 2
    add_column :evacuation_areas, :floor_area, :decimal, precision: 8, scale: 2
    add_column :evacuation_areas, :no_of_evacuees, :integer
    add_column :evacuation_areas, :other_character, :text
  end
end
