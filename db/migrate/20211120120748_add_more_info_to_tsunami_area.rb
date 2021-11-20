class AddMoreInfoToTsunamiArea < ActiveRecord::Migration[6.0]
  def change
    add_column :tsunami_areas, :district, :integer
    add_column :tsunami_areas, :classification, :integer
    add_column :tsunami_areas, :number_of_hhs, :integer
    add_column :tsunami_areas, :barangay_id, :integer
  end
end
