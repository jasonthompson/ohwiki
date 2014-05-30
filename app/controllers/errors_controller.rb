class ErrorsController < ApplicationController
  def show
    @page = requested_page
    render status_code.to_s, :status => status_code 
  end

  private

  def requested_page
    request.original_url.split('/').last
  end

  def status_code
    params[:status] || 500
  end
end
