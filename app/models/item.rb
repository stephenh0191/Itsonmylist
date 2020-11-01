class Item < ActiveRecord::Base
	belongs_to :user
	has_many :categories
	has_paper_trail  # you can pass various options here
	def completed?
		!completed_at.blank?
	end

end

