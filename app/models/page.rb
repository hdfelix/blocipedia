class Page < ActiveRecord::Base
	belongs_to :wiki

	validates :title, length: { minimum: 5 }, presence: :true
	validates :body, length: { minimum: 20 }, presence: :true
end
