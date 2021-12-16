class AddCoordinatesToTsunamiArea < ActiveRecord::Migration[6.0]
  def change
    add_column :tsunami_areas, :coordinates, :string
  end
end
