ActiveAdmin.register TsunamiArea do
  menu priority: 3
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :latlong, :risk_level
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :latlong, :risk_level]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
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