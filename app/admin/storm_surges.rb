ActiveAdmin.register StormSurge do
  menu priority: 2.5, parent: 'Risk Areas'

  permit_params :name, :district, :classification, :barangay_id, :zone, :no_of_affected_household, :latlong, :risk_level
  
  filter :district, as: :select
  filter :classification, as: :select
  filter :barangay
  filter :zone
  
  index do
    selectable_column
    id_column
    column :district
    column :classification
    column :barangay
    column :zone
    column :no_of_affected_household
    column :risk_level do |i|
      status_tag i.risk_level
    end
    column "Last updated at", :updated_at, sortable: :updated_at
    actions
  end 
  
  show do
    panel storm_surge.zone do 
      attributes_table_for storm_surge do
        row :id
        row :barangay
        row :district
        row :classification
        row :zone
        row :no_of_affected_household
        row :risk_level  do |i|
          status_tag i.risk_level
        end
        row :created_at 
        row :updated_at 
      end
    end
   
    panel "Risk Level History" do
      table_for storm_surge.water_levels.order(created_at: :desc) do
        column :status do |i|
          status_tag i.status
        end
        column :created_at 
      end
    end
  end
end
