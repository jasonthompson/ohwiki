class Page < ActiveRecord::Base
  def to_param
    '#{id}-#{title}'.parametize
  end
end
