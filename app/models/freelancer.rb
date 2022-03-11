class Freelancer < User
  has_secure_password
  validates_presence_of :isfreelancer
  validates_uniqueness_of :email
end
