class Page < ActiveRecord::Base

  validates :title, :uniqueness => true, :presence => true

  after_initialize :create_slug

  def self.open(slug)
    Page.find_by_slug(slug)
  end

  def to_param
    slug
  end

  def create_slug
    write_attribute(:slug, title.split.join("_").parameterize)
  end

end
