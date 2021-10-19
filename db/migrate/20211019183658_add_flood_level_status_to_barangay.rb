class AddFloodLevelStatusToBarangay < ActiveRecord::Migration[6.0]
  def change
    add_column :barangays, :flood_level_status, :integer, default: 0, after: :name
  end
end
