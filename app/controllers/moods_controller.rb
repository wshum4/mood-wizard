class MoodsController < ApplicationController
  def new
    @mood = Mood.new
    authorize(@mood)
  end

  def create
    @mood = Mood.new(mood_params)
    @mood.user = current_user
    authorize(@mood)
    if @mood.save
      if params[:type] == "Activity"
        redirect_to activities_path
      elsif params[:type] == "Medium"
        redirect_to mediums_path
      end
    else
      render 'new'
    end
  end

  private

  def mood_params
    params.require(:mood).permit(:sad_happy, :angry_calm, :lowenergy_highenergy, :anxious_social)
  end
end
