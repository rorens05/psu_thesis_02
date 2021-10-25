ActiveAdmin.register EvacuationArea do

  menu priority: 4

  permit_params :name, :latlong
  
  filter :name

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    column "Last updated at", :updated_at, sortable: :updated_at
    actions
  end
end
