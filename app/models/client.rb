class CLient < User
  has_secure_password
  validates_presence_of :isclient
  validates_uniqueness_of :email
end
