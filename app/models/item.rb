class Item < ActiveRecord::Base
	belongs_to :user
	has_paper_trail

	def completed?
		!completed_at.blank?
	end
  

end