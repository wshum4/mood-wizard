class ActivitiesController < ApplicationController
  def index
    @activities = policy_scope(Action).where(type: 'Activity')
  end

  def show
    @activity = Action.find(params[:id])
    authorize @activity
  end
end
