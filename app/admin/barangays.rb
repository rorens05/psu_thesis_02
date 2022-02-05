ActiveAdmin.register Barangay do
  menu priority: 2

  permit_params :name, :latlong, :flood_level_status, :population, :estimated_elevation
  
  filter :name
  filter :flood_level_status, as: :select

  index do
    selectable_column
    id_column
    column :name
    # column :flood_level_status do |i|
    #   status_tag i.flood_level_status
    # end
    column :population
    column "Last updated at", :updated_at, sortable: :updated_at
    actions
  end 

  form do |f|
    f.inputs do 
      f.semantic_errors *f.object.errors.keys
      f.input :name
      f.input :latlong
      f.input :population
      f.input :estimated_elevation
    end
    f.actions
  end

  show do
    panel barangay.name do 
      attributes_table_for barangay do
        row :id
        row :name
        row :latlong
        # row :flood_level_status do 
        #   status_tag barangay.flood_level_status
        # end
        row :population
        row :estimated_elevation do 
          "#{barangay.estimated_elevation || 0} Meters (#{(barangay.estimated_elevation || 0)* 3.28084} feet)"
        end
        row :created_at 
        row :updated_at 
      end
    end
    # panel "Coastal Areas" do
    #   table_for barangay.coastal_areas do
    #     column :name
    #     column :latlong 
    #     column :created_at 
    #   end
    # end
    # panel "Flood Level History" do
    #   table_for barangay.water_levels.order(created_at: :desc) do
    #     column :status do |i|
    #       status_tag i.status
    #     end
    #     column :created_at 
    #   end
    # end
  end
end
