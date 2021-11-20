class CreateFloods < ActiveRecord::Migration[6.0]
  def change
    create_table :floods do |t|
      t.integer :district
      t.integer :classification
      t.integer :barangay_id
      t.string :zone
      t.integer :number_of_hhs
      t.string :latlong
      t.integer :risk_level

      t.timestamps
    end
  end
end
