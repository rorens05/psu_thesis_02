class CreateWaterLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :water_levels do |t|
      t.integer :status, default: 0
      t.bigint  :entity_id
      t.string  :entity_type
      t.timestamps
    end
  end
end
