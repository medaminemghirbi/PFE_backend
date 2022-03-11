class Admin < User
  has_secure_password
  validates_presence_of :isadmin
  validates_uniqueness_of :email
end
