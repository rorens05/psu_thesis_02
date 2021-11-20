class CreateStormSurges < ActiveRecord::Migration[6.0]
  def change
    create_table :storm_surges do |t|
      t.integer :district
      t.integer :classification
      t.integer :barangay_id
      t.string :zone
      t.integer :no_of_affected_household
      t.string :latlong
      t.integer :risk_level

      t.timestamps
    end
  end
end
