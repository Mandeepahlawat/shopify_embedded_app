class Customer < ActiveRecord::Base
	has_many :recommendations
	belongs_to :shop

	def full_name
		(first_name + " " + last_name)
	end
end
