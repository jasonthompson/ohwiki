require 'spec_helper'

describe User do

  describe "email" do
    it "must exist" do
      user = User.new(:name => "Joe", :email => "", :password => "secret")
      expect(user).to be_invalid 
    end

    it "must be unique" do
      user1 = User.new(:name => "Joe", :email => "joe@example.com", :password => "s").save
      user2 = User.new(:name => "Joe", :email => "joe@example.com", :password => "s")
      expect(user2).to be_invalid
    end
  end

  it "must have a password" do
    user = User.new(:name => "Joe", :email => "joe@example.com", :password => "")
    expect(user).to be_invalid
  end
end
