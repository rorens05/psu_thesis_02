ActiveAdmin.register EvacuationArea do

  menu priority: 4


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :latlong
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
    column :created_at
    column "Last updated at", :updated_at, sortable: :updated_at
    actions
  end
end
