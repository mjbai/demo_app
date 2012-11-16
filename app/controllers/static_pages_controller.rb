class StaticPagesController < ApplicationController
  def home
    if signed_in?
@feed_items = Entry.paginate(page: params[:page])
    end	  
  end

  def help
  end

  def about
  end
end
