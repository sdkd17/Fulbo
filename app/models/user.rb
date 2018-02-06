class User < ApplicationRecord
	#roles
	enum role: [:local_owner, :player]
	after_initialize :set_default_role, :if => :new_record?

	has_secure_password
	#relaciones con los partidos
	has_many :partidos #organiza muchos partidos
	has_many :anotados
	has_many :anotado_a, through: :anotados, source: :partido
	
	#relaciones con los usuarios
	has_many :active_relationships, class_name: "Relationship",
																foreign_key: "follower_id",
																dependent: :destroy
	has_many :passive_relationships, class_name:  "Relationship",
                                 foreign_key: "followed_id",
                                 dependent:   :destroy
	has_many :following, through: :active_relationships, source: :followed
	has_many :followers, through: :passive_relationships, source: :follower 


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

	#imagenes
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/default_user.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	#seguir usuarios

	def follow (other_user)
		following << other_user
	end

	def unfollow (other_user)
		following.delete(other_user)
	end

	def following?(other_user)
		following.include?(other_user)
	end

	#roles
	def set_default_role
    self.role ||= :player
  end

	private


end
