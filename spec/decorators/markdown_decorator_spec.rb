require 'rspec/autorun'
require 'ostruct'
require_relative '../../app/decorators/markdown_decorator.rb'

describe MarkdownDecorator do
  let(:model){OpenStruct.new(:title => "This is *so* cool",
                             :body => "And here's [a link](#).")}
  subject{MarkdownDecorator.new(model)}

  it "returns an object with html title", :no_db => true do
    subject.title.should eq "This is <em>so</em> cool"
  end

  it "returns and object with html body", :no_db => true do
    subject.body.should eq %Q{<p>And here&#39;s <a href="#">a link</a>.</p>\n} 
  end
end
