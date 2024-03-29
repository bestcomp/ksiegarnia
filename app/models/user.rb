class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :omniauthable, :token_authenticatable,
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
		:validatable, :confirmable,
	 :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
end
