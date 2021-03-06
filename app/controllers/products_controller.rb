class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :edit ]
  before_action :correct_user,   only: [:destroy, :edit ]


  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      flash[:success] = 'Product created!'
      redirect_to current_user
    else
      @feed_items = []
      render '/user/:id'
    end
  end

def index
  @products = Product.all
  if params[:search]
    @product = Product.search(params[:search]).order("created_at DESC")
  else
    @products = Product.all.order('created_at DESC')
  end
end

  def show
    @product = Product.find(params[:id])
    @user = User.find(params[:id])
    @products = @user.products.paginate(page: params[:page])
    @reviews = @user.reviews.paginate(page: params[:page])
    @votes = @user.votes.paginate(page: params[:page])
    if logged_in?
    @product = Product.find(params[:id])
    @review = current_user.reviews.build
    @vote = @product.votes.build
    @feed_items = current_user.feed.paginate(page: params[:page])

  end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = 'Product updated'
      redirect_to current_user
      # Handle a successful update.
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success] = 'Product deleted'
    redirect_to request.referrer || root_url
  end


  private

    def product_params
      params.require(:product).permit(:product, :description, :brand, :category, :price, :picture, :target)
    end

    def correct_user
      @user = User.find(params[:id])
      # redirect_to(current_user) unless current_user?(@user)
    end
end
