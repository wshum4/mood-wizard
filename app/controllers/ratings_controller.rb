class RatingsController < ApplicationController
  def new
    @rating = Rating.new
    @activity = Action.find(params[:activity_id])
    authorize(@rating)
  end

  def create
    @rating = Rating.new(rating_params)
    @activity = Action.find(params[:activity_id])
    @rating.action = @activity
    @rating.user = current_user
    authorize(@rating)
    
    if @rating.save
      redirect_to activity_path(@activity)
    else
      render 'new'
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rating, :comment)
  end
end
