class  SessionsController < Devise::SessionsController

	add_breadcrumb "Home", :root_path, :options => { :title => "Home" }

  def new
    add_breadcrumb "New Session", :new_user_session_path, :options => { :title => "New Session" }
    super
    @resource = resource
  end

end