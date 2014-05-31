require 'redcarpet'

class MarkdownDecorator
  class << self
    def decorate(obj)
      if obj.respond_to?(:each)
        @@model_name = obj.first.class
        pages = []
        obj.each do |o|
          pages << self.new(o)
        end
        return pages
      else
        return self.new(obj)
      end
    end

    def method_missing(method_sym, *args, &block)
      method = method_sym.to_s
      @@model_name.method(args.first)
    end
  end

  def initialize(model)
    @model = model
  end

  def model?
    @model
  end

  def title
    strip_paragraphs(renderer.render(@model.title)).html_safe
  end

  def body
    renderer.render(@model.body).html_safe
  end

  def to_param
    @model.to_param
  end

  private

  def strip_paragraphs(text)
    text.gsub('<p>', '').gsub('</p>', '').rstrip
  end

  def renderer
    Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
end
