require 'spec_helper'

describe Page do
  subject{Page.new(:title => "My first page", 
                   :body => 'This is my first page!')}
end
