class Log < ActiveRecord::Base
	validates :title, presence: true, length: { maximum: 200, too_long: "%{count} characters is the maximum allowed"  }
	validates :content, presence: true

	belongs_to :user
	belongs_to :city
end
