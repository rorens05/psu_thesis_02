ActiveAdmin.register TsunamiArea do
  menu priority: 3

  permit_params :name, :latlong, :risk_level
  
  filter :name
  filter :risk_level, as: :select

  index do
    selectable_column
    id_column
    column :name
    column :risk_level do |i|
      status_tag i.risk_level
    end
    column "Last updated at", :updated_at, sortable: :updated_at
    actions
  end 

  show do
    panel tsunami_area.name do 
      attributes_table_for tsunami_area do
        row :id
        row :name
        row :latlong
        row :risk_level  do |i|
          status_tag i.risk_level
        end
        row :created_at 
        row :updated_at 
      end
    end
   
    panel "Risk Level History" do
      table_for tsunami_area.water_levels.order(created_at: :desc) do
        column :status do |i|
          status_tag i.status
        end
        column :created_at 
      end
    end
  end
end
