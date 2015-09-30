class Log < ActiveRecord::Base
	validates :title, presence: true, length: { maximum: 200, too_long: "%{count} characters is the maximum allowed"  }
	validates :content, presence: true

	belongs_to :user
	belongs_to :city

	has_many :log_taggings
	has_many :tags, through: :log_taggings

	def all_tags=(names)
	  	self.tags = names.split(", #").map do |name|
	    Tag.where(name: name.strip).first_or_create!
	  end
	end

	def all_tags
	  self.tags.map(&:name).join(", #")
	end

end
