class Item < ActiveRecord::Base
	belongs_to :user
	has_many :versions
	has_paper_trail on: [:destroy] # you can pass various options here
	def completed?
		!completed_at.blank?
	end
	validates :title, presence: true, length: {minimum: 6, maximum: 100}
	validates :description, presence: true, length: {minimum: 10, maximum: 300}
end

