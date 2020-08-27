class ActivitiesController < ApplicationController
  def index
    @activities = policy_scope(Action).where(action_type: 'Activity')
    # for each action check based on mood comparison
    @activities = @activities.select { |activity| activity.mood_available?(current_user) }

    # if time range availability given, select acivities available
    if params[:query].present?
      @activities = @activities.select { |activity| activity.time_available? }
    else
      @activities = @activities.select { |activity| activity.currently_available? }
    end
    # if geo location given, select activities available
  end

  def show
    @activity = Action.find(params[:id])
    authorize(@activity)
  end
end
