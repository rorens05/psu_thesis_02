class HomeController < ApplicationController
  def index;
    redirect_to admin_dashboard_path
  end
end
