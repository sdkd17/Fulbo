class Local < ApplicationRecord
	has_many :courts
	belongs_to :user 
end
