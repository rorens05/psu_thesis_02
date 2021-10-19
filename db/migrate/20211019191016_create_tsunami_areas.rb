class CreateTsunamiAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :tsunami_areas do |t|
      t.string :name
      t.string :latlong
      t.integer :risk_level, null: false, default: 0

      t.timestamps
    end
  end
end
