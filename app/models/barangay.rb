class Barangay < ApplicationRecord
  has_many :water_levels, as: :entity, dependent: :destroy
  has_many :coastal_areas, dependent: :destroy
  enum flood_level_status: ["LOW RISK", "MEDIUM RISK", "HIGH RISK"]
  validates :flood_level_status, presence: true

  before_update :create_water_level if :flood_level_status_changed?
  after_create :create_water_level

  def create_water_level
    water_level = WaterLevel.new(
      status: self.flood_level_status
    )
    water_levels << water_level
  end
end
