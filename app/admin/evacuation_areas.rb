ActiveAdmin.register EvacuationArea do

  menu priority: 4

  permit_params :name, 
                :latlong, 
                :barangay_id,
                :total_evacuation_center,
                :exact_location,
                :proximity,
                :floor_area,
                :no_of_evacuees,
                :other_character
  
  filter :name

  index do
    selectable_column
    id_column
    column "No. of Evacuation Center", :total_evacuation_center
    column :barangay
    column "Name ", :name
    column "Location ", :exact_location
    column :proximity
    column "Floor Area (sq. meter)",:floor_area
    column :no_of_evacuees
    column :other_character
    column "Last updated at", :updated_at, sortable: :updated_at
    actions
  end
end
