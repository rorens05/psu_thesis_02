ActiveAdmin.register_page "Interactive Map" do
  menu priority: 1, label: "Interactive map"

  content title: "Interactive map" do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        p "Ongoing development"
      end
    end

  end 
end
