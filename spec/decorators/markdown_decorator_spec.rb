require 'spec_helper'
require 'ostruct'
require_relative '../../app/decorators/markdown_decorator.rb'

describe MarkdownDecorator do
  include ActionView::Helpers

  let(:model){OpenStruct.new(:title => "This is *so* cool",
                             :body => "And here's [a link](#).")}
  let(:model2){OpenStruct.new(:title => "Another Post",
                              :body => "All about filler.")}
  subject{MarkdownDecorator.decorate(model)}

  describe "instantiation with page" do
    it "returns an object with html title", :no_db => true do
      subject.title.should eq "This is <em>so</em> cool"
    end

    it "returns and object with html body", :no_db => true do
      subject.body.should eq %Q{<p>And here&#39;s <a href="#">a link</a>.</p>\n} 
    end
  end

  describe "instantiation with array of pages" do
    it "returns and array of pages" do
      pages = [] << model << model2
      MarkdownDecorator.decorate(pages)[1].title.should eq 'Another Post'
    end
  end
end
