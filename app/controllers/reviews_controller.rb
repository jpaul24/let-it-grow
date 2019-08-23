class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]

  def create
    @review = Review.new(review_params)
    @garden = Garden.find(params[:garden_id].to_i)
    @review.rating = params[:review][:rating].to_i
    @review.garden = @garden
    @review.user = current_user
    if @review.save
      respond_to do |format|
        format.html { redirect_to garden_path(@garden) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'gardens/show' }
        format.js  # <-- idem
      end
    end
    authorize @review
  end

  def destroy
    @garden = Garden.find(@review.garden_id)
    @review.destroy
    # redirect_to garden_path(@garden)
    authorize @review
  end

  private

  def set_review
    @review = Review.find(params[:id])
    authorize @review
  end

  def review_params
    params.require(:review).permit(:description, :rating, :user_id, :garden_id)
  end
end
