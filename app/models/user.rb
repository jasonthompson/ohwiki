class User < ActiveRecord::Base
  has_secure_password

  validates :email, :uniqueness => true, :presence => true

  def self.authenticate(params)
    self.find_by_email(params[:email])
  end
end

