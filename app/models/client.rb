class CLient < User
  has_secure_password
  validates_presence_of :role, presence: true, default: 'client'
  validates_uniqueness_of :email
end
