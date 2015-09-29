class CityPost < ActiveRecord::Base
	belongs_to :city
	belongs_to :post
end
