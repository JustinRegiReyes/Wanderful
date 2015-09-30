class Tag < ActiveRecord::Base
	has_many :log_taggings
	has_many :logs, through: :log_taggings
end
