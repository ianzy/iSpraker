class User < ActiveRecord::Base
  # has_many :services
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable :validatable
  devise :database_authenticatable, :registerable,
             :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  
end
