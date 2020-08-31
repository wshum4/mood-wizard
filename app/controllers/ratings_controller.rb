class RatingsController < ApplicationController
  def new
    @rating = Rating.new
    @activity = Action.find(params[:activity_id])
    @mood = Mood.new
    authorize(@rating)
  end

  def create
    @rating = Rating.new(rating_params)
    @activity = Action.find(params[:activity_id])
    @rating.action = @activity
    @rating.user = current_user
    @mood = Mood.new(mood_params)
    @mood.user = current_user
    authorize(@rating)

    if @rating.save && @mood.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rating, :comment)
  end

  def mood_params
    params.require(:mood).permit(:sad_happy, :angry_calm, :lowenergy_highenergy, :anxious_social)
  end
end
