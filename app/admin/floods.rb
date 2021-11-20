ActiveAdmin.register Flood do
  menu priority: 2.5, parent: 'Risk Areas'

  permit_params :name, :district, :classification, :barangay_id, :zone, :number_of_hhs, :latlong, :risk_level

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
    column :number_of_hhs
    column :risk_level do |i|
      status_tag i.risk_level
    end
    column "Last updated at", :updated_at, sortable: :updated_at
    actions
  end 
  
  show do
    panel flood.zone do 
      attributes_table_for flood do
        row :id
        row :barangay
        row :district
        row :classification
        row :zone
        row :number_of_hhs
        row :risk_level  do |i|
          status_tag i.risk_level
        end
        row :created_at 
        row :updated_at 
      end
    end
   
    panel "Risk Level History" do
      table_for flood.water_levels.order(created_at: :desc) do
        column :status do |i|
          status_tag i.status
        end
        column :created_at 
      end
    end
  end
end
