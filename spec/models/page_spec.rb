require 'spec_helper'

describe Page do
  subject{Page.new(:title => "My first page", 
                   :body => 'This is my first page!')}

  describe "slug" do
    it "returns the correct value" do
      expect(subject.slug).to eq 'My_first_page'
    end
  end
end
