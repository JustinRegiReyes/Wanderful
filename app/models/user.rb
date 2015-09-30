class User < ActiveRecord::Base
	validates :first_name, :last_name, :email, :password, presence: true
	validates :email, uniqueness: true
	has_secure_password
	has_many :logs
	has_many :cities

	def self.confirm(params)
		@user = User.find_by_email(params[:email])
		@user.try(:authenticate, params[:password])

	end
end
