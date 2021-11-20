class AddPopulationAndElevationToBarangay < ActiveRecord::Migration[6.0]
  def change
    add_column :barangays, :population, :integer
    add_column :barangays, :estimated_elevation, :decimal, precision: 10, scale: 2
  end
end
