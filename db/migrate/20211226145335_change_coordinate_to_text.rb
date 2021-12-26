class ChangeCoordinateToText < ActiveRecord::Migration[6.0]
  def change
    change_column :tsunami_areas, :coordinates, :text
    change_column :floods, :coordinates, :text
    change_column :storm_surges, :coordinates, :text
  end
end
