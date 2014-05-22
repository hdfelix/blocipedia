class Wiki < ActiveRecord::Base

	has_many :pages, dependent: :destroy
  belongs_to :user

	validates :title, length: { minimum: 1 }, presence: :true
	validates :description, length: { minimum: 10 }, presence: :true

end
