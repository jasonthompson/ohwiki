require 'spec_helper'

describe Page do
  let(:page_info){{:title => "My first page",
                  :body => 'This is my first page!'}}

  subject{Page.new(page_info)}

  describe '#title' do
    it 'must be unique' do
      Page.new(page_info).save
      subject.save.should be_false
    end
  end

  describe '#open' do
    it 'returns the page' do
      slug = URI.escape(page_info[:title].downcase.split.join("_"))
      subject.save
      Page.open(slug).title.should eq page_info[:title] 
    end
  end
end
