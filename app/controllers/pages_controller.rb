class PagesController < ApplicationController
  before_filter :authorize

  def index
  end

  def show
    @page = Page.find(params[:id])
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
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    if @page.update(page_params)
      redirect_to page_path @page
    else
      render 'edit'
    end
  end

  def new
    @page = Page.new
  end

  def destroy
  end

  private

  def page_params
    params.require(:page).permit(:title, :body, :id)
  end
end
