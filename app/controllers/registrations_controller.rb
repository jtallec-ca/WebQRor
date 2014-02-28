class  RegistrationsController < Devise::RegistrationsController

	add_breadcrumb "Home", :root_path, :options => { :title => "Home" }

	def edit
		add_breadcrumb "My Account", :edit_user_registration_path, :options => { :title => "My Account" }
	end

end