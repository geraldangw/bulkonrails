class VotesController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def show
    @product = Product.find(params[:id])
    @votes = @product.votes.paginate(page: params[:page])
  end

  def create
    @vote = current_user.votes.build(vote_params)
    if @vote.save
      p "Thanks for joining!"
      flash[:success] = 'Thanks for joining!'
      redirect_to :back
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @vote.destroy
    flash[:success] = 'Vote deleted'
    redirect_to :back
  end

  private

    def vote_params
      params.require(:vote).permit(:user_id, :product_id)
    end

    def correct_user
      @vote = current_user.reviews.find_by(id: params[:id])
      redirect_to root_url if @vote.nil?
    end

end
