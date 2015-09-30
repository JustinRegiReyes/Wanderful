class Log < ActiveRecord::Base
	belongs_to :user
	belongs_to :city

	has_many :log_taggings
	has_many :tags, through: :log_taggings
end
