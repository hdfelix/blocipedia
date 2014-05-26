class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

	has_many :wikis
	validates :name, presence: true
	after_create :create_customer

	def role?(base_role)
		role == base_role.to_s
	end

	def create_customer
		token = self.stripe_card_token

		customer = Stripe::Customer.create(
								card: token,
								plan: 'bp_premium',
								email: self.email
		)
	end
end
