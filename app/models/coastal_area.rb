class CoastalArea < ApplicationRecord
  belongs_to :barangay
  
  has_many :water_levels, as: :entity, dependent: :destroy
  enum risk_level: ["LOW RISK", "MEDIUM RISK", "HIGH RISK"]
  validates :risk_level, presence: true

  before_update :create_water_level if :risk_level_changed?
  after_create :create_water_level

  def create_water_level
    water_level = WaterLevel.new(
      status: self.risk_level
    )
    water_levels << water_level
  end
end
