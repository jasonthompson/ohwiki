require 'spec_helper'

describe User do
  let(:user_args){
                   {:first_name => "Joe",
                    :last_name => "Smith",
                    :email => "joe@example.com",
                    :password => "secret",
                    :password_confirmation => "secret"}
                 }

  subject{User.new(user_args)}

  describe "email" do
    it "must exist" do
      user = User.new(user_args.merge({:email => ""}))
      expect(user).to be_invalid
    end

    it "must be unique" do
      subject.save
      user2 = User.new(user_args.merge({:password => "d",
                                        :password_confirmation => "d"}))
      expect(user2).to be_invalid
    end
  end

  describe "password" do
    it "must exist" do
      user = User.new(user_args.merge({:password => ""}))
      expect(user).to be_invalid
    end
  end

  describe "password_confirmation" do
    it "must exist" do
      user = User.new(user_args.merge({:password_confirmation => ""}))
      expect(user).to be_invalid
    end
  end

  describe "#authenticate" do
    it "must authenticate user" do
      subject.save
      subject.authenticate('secret').should eq subject
    end

    it "must not authenticate user with wrong password" do
      user = User.new(user_args)
      user.save
      user.authenticate('wrong').should be_false
    end
  end

  describe "remember token" do
    before { subject.save }
    it {should respond_to(:remember_token)}
  end
end
