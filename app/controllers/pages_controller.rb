require 'active_support/inflector'

class PagesController < ApplicationController
  before_filter :authorize

  def index
    @pages = Page.all
  end

  def show
    @page = Page.open(params[:id])
    unless @page
      @title = ActiveSupport::Inflector.titleize(params[:id])
      render :non_existent
    end
  end

  # def non_existent
  # end

  def create
    @page = Page.new(page_params)

    if @page.save
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
  end

  private

  def page_params
    params.require(:page).permit(:title, :body, :id)
  end
end
