class User < ApplicationRecord
	# LINK
	has_many :attendances
	has_many :events, through: :attendances

	# VALIDATIONS
	validates :email, presence: true,
		uniqueness: true
	validates :first_name, presence: true,
		length: {minimum: 2}
	validates :last_name, presence: true,
		length: {minimum: 2}
	validates :description, presence: true,
		length: {minimum: 20, maximum: 500}
end
