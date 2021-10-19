class AddRiskLevelToCoastal < ActiveRecord::Migration[6.0]
  def change
    add_column :coastal_areas, :risk_level, :integer
  end
end
