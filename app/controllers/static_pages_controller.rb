class StaticPagesController < ApplicationController
  def home
    if logged_in?
    @product  = current_user.products.build
    # debugger
    @review = current_user.reviews.build
    @vote = current_user.votes.build
    @feed_items = current_user.feed.paginate(page: params[:page])
  end
  end

  def help
  end

  def about
  end

  def contact
  end
end
