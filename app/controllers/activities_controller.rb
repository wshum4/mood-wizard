class ActivitiesController < ApplicationController
  def index
    @activities = policy_scope(Action).where(action_type: 'Activity')
    # selecting activities based on Mood comparison
    # for each action check based on mood comparison
    @activities = @activities.select { |activity| activity.compare_against(current_user) }
    # if time range availability given, select acivities available
    # if geo location given, select activities available

  end

  def show
    @activity = Action.find(params[:id])
    authorize(@activity)
  end
end
