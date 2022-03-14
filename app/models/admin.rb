class Admin < User
  has_secure_password
  validates_presence_of :isadmin, presence: true
  validates_uniqueness_of :email
end
