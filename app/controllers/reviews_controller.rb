class ReviewsController < ApplicationController
  before_action :only => [:edit, :update, :destroy] do
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render:new
  end
  
  def show
    @review = Review.find(params[:id])
    @product = @review.product
    render :show
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review has been successfully added"
      redirect_to product_path(@review.product)
    else
      flash[:notice] = "Your product has not been added."
      render :new
    end
  end

  def edit 
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    render :edit
  end

  def update 
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review successfully updated!"
      redirect_to product_review_path(@product, @review)
    else
      flash[:notice] = "Your product was not added."
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review was successfully deleted"
    redirect_to product_path(@review.product)
  end

  private
    def review_params
      params.require(:review).permit(:author, :content_body, :rating)
    end
end