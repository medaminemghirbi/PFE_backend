class Freelancer < User
  has_secure_password
  validates_presence_of :role, presence: true, default: 'freelancer'
  validates_uniqueness_of :email

  belongs_to :language 

  has_many :missions 
end
