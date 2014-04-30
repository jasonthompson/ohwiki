class User < ActiveRecord::Base
  attr_accessor :password

  validates :email, :presence => true
end
