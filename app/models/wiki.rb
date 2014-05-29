class Wiki < ActiveRecord::Base

  has_many :pages, dependent: :destroy
  has_many :charges
  belongs_to :user

  accepts_nested_attributes_for :charges

  validates :title, length: { minimum: 1 }, presence: :true
  validates :description, length: { minimum: 10 }, presence: :true
end
