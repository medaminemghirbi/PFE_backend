class Freelancer < User
  has_secure_password
  validates_presence_of :role, presence: true, default: 'freelancer'
  validates_uniqueness_of :email
end
