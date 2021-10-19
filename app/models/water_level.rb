class WaterLevel < ApplicationRecord
  belongs_to :entity, polymorphic: true
  enum status: ["LOW RISK", "MEDIUM RISK", "HIGH RISK"]

end
