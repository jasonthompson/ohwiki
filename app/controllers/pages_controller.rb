require 'active_support/inflector'
require_relative '../decorators/markdown_decorator'

class PagesController < ApplicationController
  before_filter :authorize

  def index
    @pages = MarkdownDecorator.decorate(Page.all)
  end

  def show
    @page = MarkdownDecorator.decorate(Page.open(params[:id]))
    unless @page.model?
      @title = ActiveSupport::Inflector.titleize(params[:id])
      render :non_existent
    end
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      flash[:notice] = "Page was successfully created."
      render :show
    else
      render :edit
    end
  end

  def edit
    @page = Page.open(params[:id])
  end

  def update
    @page = Page.open(params[:id])

    if @page.update(page_params)
      redirect_to page_path @page
    else
      render 'edit'
    end
  end

  def new
    @title = params[:title] || ""
    @page = Page.new
  end

  def destroy
    @page = Page.open(params[:id])
    if @page.destroy
      flash[:notice] = %Q{ "#{@page.title}" was successfully deleted.}
      redirect_to pages_path
    else
      flash[:notice] = "An error prevented this page from being deleted."
    end
  end

  private

  def page_params
    params.require(:page).permit(:title, :body, :id)
  end
end
