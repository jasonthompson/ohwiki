require 'redcarpet'

class MarkdownDecorator
  def initialize(model)
    @model = model
  end

  def title
    strip_paragraphs(renderer.render(@model.title))
  end

  def body
    renderer.render(@model.body)
  end

  private

  def strip_paragraphs(text)
    text.gsub('<p>', '').gsub('</p>', '').rstrip
  end

  def renderer
    Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
end
