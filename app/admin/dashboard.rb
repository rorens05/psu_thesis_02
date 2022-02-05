ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do

    div do
      render 'dashboard'
    end

    div class: "blank_slate_container", id: "dashboard_default_message" do
      render 'reports'
    end
  end 
end
