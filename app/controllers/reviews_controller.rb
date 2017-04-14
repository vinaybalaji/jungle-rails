class ReviewsController < ApplicationController
  def create
    review = create_review
    if review.valid?
      redirect_to :back
    else 
      redirect_to :back
    end
  end

  def destroy
    @review = Review.find params[:id]
    if @review.user_id == current_user.id
      @review.destroy
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private

  def create_review
    review = Review.new(
      product_id: params[:product_id].to_i,
      description: params[:review][:description],
      rating: params[:review][:rating].to_i,
      user_id: current_user.id
    )
    review.save!
    review
  end
end
