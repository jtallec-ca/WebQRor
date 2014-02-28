class PagesController < ApplicationController
  
	add_breadcrumb "Home", :root_path, :options => { :title => "Home" }

  def home
  end

  def about
  	add_breadcrumb "About", :about_path, :options => { :title => "About" }
  end
end
