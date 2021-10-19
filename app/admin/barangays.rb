ActiveAdmin.register Barangay do
  menu priority: 2

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :latlong, :flood_level_status
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :latlong]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do
    selectable_column
    id_column
    column :name
    column :flood_level_status do |i|
      status_tag i.flood_level_status
    end
    column "Last updated at", :updated_at, sortable: :updated_at
    actions
  end 

  show do
    panel barangay.name do 
      attributes_table_for barangay do
        row :id
        row :name
        row :latlong
        row :flood_level_status do 
          status_tag barangay.flood_level_status
        end
        row :created_at 
        row :updated_at 
      end
    end
    panel "Coastal Areas" do
      table_for barangay.coastal_areas do
        column :name
        column :latlong 
        column :created_at 
      end
    end
    panel "Flood Level History" do
      table_for barangay.water_levels.order(created_at: :desc) do
        column :status do |i|
          status_tag i.status
        end
        column :created_at 
      end
    end
  end
end
