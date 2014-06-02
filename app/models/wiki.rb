class Wiki < ActiveRecord::Base

  belongs_to :user
  has_many :pages, dependent: :destroy
  has_many :charges
  has_and_belongs_to_many :collaborators, class_name: 'User'

  accepts_nested_attributes_for :charges

  validates :title, length: { minimum: 1 }, presence: :true
  validates :description, length: { minimum: 10 }, presence: :true
end
