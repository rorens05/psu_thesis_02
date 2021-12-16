class AddCoordinatesToFloods < ActiveRecord::Migration[6.0]
  def change
    add_column :floods, :coordinates, :string
  end
end
