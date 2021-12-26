class ChangeEvacuationAreaProximityAndFloorAreaDatatype < ActiveRecord::Migration[6.0]
  def change
    
    change_column :evacuation_areas, :proximity, :text
    change_column :evacuation_areas, :floor_area, :text
  end
end
