class Admin::DashboardController < ApplicationController

	add_breadcrumb "Home", :root_path, :options => { :title => "Home" }
	add_breadcrumb "Admininstration", :admin_path, :options => { :title => "Admininstration" }

  def index
  	add_breadcrumb "Dashboard", :admin_dashboard_index_path, :options => { :title => "Dashboard" }
  end
end
