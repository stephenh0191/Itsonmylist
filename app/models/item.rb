class Item < ActiveRecord::Base
	belongs_to :user
	has_paper_trail on: [:destroy] # you can pass various options here
	def completed?
		!completed_at.blank?
	end

end

