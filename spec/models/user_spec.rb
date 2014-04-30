require 'spec_helper'

describe User do

  it "must have a username" do
    user = User.new(:name => "Joe", :email => "joe@example.com", :password => "secret")
    expect(user).to be_valid 
  end

  it "must have a password" do
  end
  end
end
