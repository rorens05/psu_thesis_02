class EvacuationArea < ApplicationRecord
  belongs_to :barangay, optional: true
end
