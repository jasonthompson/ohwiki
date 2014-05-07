require 'spec_helper'

describe User do
  let(:user_args){
                   {:name => "Joe",
                    :email => "joe@example.com",
                    :password => "secret",
                    :password_confirmation => "secret"}
                 }
  describe "email" do
    it "must exist" do
      user = User.new(user_args.merge({:email => ""}))
      expect(user).to be_invalid
    end

    it "must be unique" do
      user1 = User.new(user_args).save
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

  describe "password_cofirmation" do
    it "must exist" do
      user = User.new(user_args.merge({:password_confirmation => ""}))
      expect(user).to be_invalid
   end
  end
end
