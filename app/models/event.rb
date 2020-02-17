class Event < ApplicationRecord
	# LINK
	has_many :attendances
	has_many :users, through: :attendances
	belongs_to :admin, class_name: "User"

	# VALIDATIONS
	validates :start_date, presence: true
	validates :duration, presence: true
	validates :title, presence: true,
		length: {minimum: 5, maximum: 140}
	validates :description, presence: true,
		length: {minimum: 20, maximum: 1000}
	validates :price, presence: true,
		numericality: {greter_than_or_equal_to: 1, less_than_or_equal_to: 1000} 
	validates :location, presence: true
	validates :admin, presence: true
	
	# VALIDATIONS - METHODES
	validate :valid_duration?
	validate :valid_start_date?

	def valid_duration?
		if (self.duration % 5 != 0)
			self.errors.add(:duration, 
											"ERREUR - La Duree doit etre un multiple de 5.")
		puts "ERREUR - Duree invalide"
		elsif (self.duration > 0 && self.duration < 5)
			self.errors.add(:duration, 
											"ERREUR - La Duree doit etre positive.")
		puts "ERREUR - Duree invalide"
		end
	end

	def valid_start_date?
		if (self.start_date < DateTime.now)
			self.errors.add(:start_date,
											"ERREUR - Vous ne pouvez creer d'evenement que dans le futur.")
		puts "ERREUR - Date invalide"
		end
	end
end
