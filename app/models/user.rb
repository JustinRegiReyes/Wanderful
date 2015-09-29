class User < ActiveRecord::Base
	has_secure_password
	has_many :logs
	has_many :cities

end
