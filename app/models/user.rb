class User < ActiveRecord::Base
  has_secure_password
  before_create :create_remember_token

  validates :email, :uniqueness => true, :presence => true

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token) 
  end
end

