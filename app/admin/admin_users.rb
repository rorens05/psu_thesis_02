ActiveAdmin.register AdminUser do
  # menu parent: 'Users'
  permit_params :email, :name, :role, :status, :password, :password_confirmation, :image

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :status do |user|
      status_tag user.status
    end
    column :created_at
    actions
  end

  filter :email
  filter :role, as: :select
  filter :status, as: :select
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :image, as: :file
      f.input :email
      f.input :name
      f.input :role
      f.input :status
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show do
    panel "Admin User Details" do
      attributes_table_for admin_user do
        row :id
        row :email
        row :name
        row :status do 
          status_tag admin_user.status
        end
        row :created_at
        row :updated_at
      end
    end
  end

end
