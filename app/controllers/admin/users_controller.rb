class Admin::UsersController < ApplicationController

	add_breadcrumb "Home", :root_path, :options => { :title => "Home" }
	add_breadcrumb "Admininstration", :admin_path, :options => { :title => "Admininstration" }
  
  def create

  end

  def index
  	add_breadcrumb "Manage Users", :admin_users_path, :options => { :title => "Manage Users" }
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    account_update_params = (params.require(:user).permit( :email, :first_name, :last_name, :password, :current_password, :role_ids, :password_confirmation))

    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    #@user = User.find(current_user.id)
    if @user.update_attributes(account_update_params)
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
    	flash[:notice] = "Successfully updated user '#{@user.email}'."
      redirect_to admin_users_path
    else
      render "edit"
    end

  end

end
