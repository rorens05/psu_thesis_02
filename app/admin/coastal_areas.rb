ActiveAdmin.register CoastalArea do
  # menu priority: 3, parent: 'Risk Areas'
  menu false
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :barangay_id, :name, :latlong, :risk_level
  #
  # or
  #
  # permit_params do
  #   permitted = [:barangay_id, :name, :latlong]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :name
  filter :risk_level, as: :select

  index do
    selectable_column
    id_column
    column :name
    column :barangay
    column :risk_level do |i|
      status_tag i.risk_level
    end
    column "Last updated at", :updated_at, sortable: :updated_at
    actions
  end 

  show do
    panel coastal_area.name do 
      attributes_table_for coastal_area do
        row :id
        row :barangay
        row :name
        row :latlong
        row :risk_level do |i|
          status_tag i.risk_level
        end
        row :created_at 
        row :updated_at 
      end
    end
   
    panel "Risk Level History" do
      table_for coastal_area.water_levels.order(created_at: :desc) do
        column :status do |i|
          status_tag i.status
        end
        column :created_at 
      end
    end
  end
end
