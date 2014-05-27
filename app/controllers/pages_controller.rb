class PagesController < ApplicationController
  def index
  end

  def show
    @page = Page.new(page_params)
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      render :show 
    else
      render :edit
    end
  end

  def edit
    @page = Page.new(page_params)
  end

  def new
    @page = Page.new
  end

  def update
  end
  def destroy
  end

  private

  def page_params
    params.require(:page).permit(:title, :body)
  end
end
