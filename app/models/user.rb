class User < ActiveRecord::Base
  rolify
  # attr_accessible :role_ids
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  def delete_role(role_symbol,target=nil)
    UsersRoles.delete_role self,role_symbol,target
	end
end
