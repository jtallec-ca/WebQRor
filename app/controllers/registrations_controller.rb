class  RegistrationsController < Devise::RegistrationsController

	add_breadcrumb "Home", :root_path, :options => { :title => "Home" }

	def edit
		add_breadcrumb "My Account", :edit_user_registration_path, :options => { :title => "My Account" }
	end

  def update
  	# debugger
  	@user = User.find(current_user.id)
  	# Role.all.each do |role|
  		# logger.debug "Here 1 - removing #{role.name}"
  		# @user.remove_role role.name
  	# end
  	if params[:user][:role_ids].present?
  		# logger.debug "Here 2 - There are roles on the user profile"
  		params[:user][:role_ids].each do |role_id_param, value |
        case value
        when "0"
          # logger.debug "Here 3 - Removing role_param #{role_id_param} - #{value}"
          @user.delete_role Role.find(role_id_param).name
        when "1"
    			# logger.debug "Here 4 - Adding role_param #{role_id_param} - #{value}"
          @user.add_role Role.find(role_id_param).name
        else
          # do nothing  
          # logger.debug "Here 5 - Do nothing - #{role_id_param} - #{value}"
        end
  		end
  	end
  	super
  end

  protected 
  def after_update_path_for(resource)
    edit_user_registration_path(resource)
  end

end