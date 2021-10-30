ActiveAdmin.register_page "Interactive Map" do
  menu priority: 1, label: "Interactive map"

  content title: "Interactive map" do
    render "main_map"
  end 
end
