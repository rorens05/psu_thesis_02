class CreateCoastalAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :coastal_areas do |t|
      t.references :barangay, null: false, foreign_key: true
      t.string :name
      t.string :latlong

      t.timestamps
    end
  end
end
