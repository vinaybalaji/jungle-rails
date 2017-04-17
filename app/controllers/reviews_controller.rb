class ReviewsController < ApplicationController
before_filter :current_user

  def create
    review = create_review
    if !review.valid?
      flash[:notice] = "Oops. Could not save review. Please try again"
    end
    redirect_to :back
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to :back
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
