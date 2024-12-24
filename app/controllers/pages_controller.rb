class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:logout]

  def home; end

  def apply
    @plan_name = params[:plan_name] || 'free'
  end

  def thanks
    
  end

  def start
  end

  def logout
    sign_out(current_user)
    redirect_to root_path
  end

  def page
    @page_key = request.path[1..]
    render "pages/#{@page_key}"
  end
end
