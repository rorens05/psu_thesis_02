class StormSurge < ApplicationRecord
  has_many :water_levels, as: :entity, dependent: :destroy
  enum risk_level: ["LOW RISK", "MEDIUM RISK", "HIGH RISK"]
  enum district: ["Central", "Southern", "Western"]
  enum classification: ["Urban", "Rural"]
  belongs_to :barangay, optional: true

  validates :risk_level, presence: true
  validates :district, presence: true
  validates :classification, presence: true
  validates :no_of_affected_household, presence: true

  before_update :create_water_level if :risk_level_changed?
  after_create :create_water_level

  def create_water_level
    water_level = WaterLevel.new(
      status: self.risk_level
    )
    water_levels << water_level
  end
end
