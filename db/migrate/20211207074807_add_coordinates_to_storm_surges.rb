class AddCoordinatesToStormSurges < ActiveRecord::Migration[6.0]
  def change
    add_column :storm_surges, :coordinates, :string
  end
end
