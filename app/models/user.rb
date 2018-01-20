class User < ApplicationRecord
	has_secure_password
	has_many :partidos #organiza muchos partidos
	has_many :anotados
	has_many :anotado_a, through: :anotados, source: :partido
	

	before_save { self.nick = nick.downcase }
	validates :nick, 	presence: true, 
									 	length: {minimum: 5}, 		
									 	uniqueness: {case_sensitive: false}
	validates :password, presence: true,
											 length: { minimum: 6 }
	validates :email, presence: true,
										format: { with: /\A\w[\w\d]+@\w+.com/ },
										uniqueness: true
	validates :nombre, presence: true
	validates :apellido, presence: true
	validates :nacimiento, presence: true
end
