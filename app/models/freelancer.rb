class Freelancer < User
  has_secure_password
  validates_presence_of :isfreelancer, presence: true
  validates_uniqueness_of :email
  has_many :educations
end
