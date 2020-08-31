class ActivitiesController < ApplicationController
  def index
    @activities = policy_scope(Action).where(action_type: 'Activity')

    # if geo location given, select activities available
    if params["location"].present?
      @activities = Action.near(params["location"], 20)
      @location = Geocoder.search(params["location"]).first.coordinates
      @distances = {}
      @activities.each { |a| @distances[a.id] = a.distance_to(@location).truncate(2) }
    end

    # for each action check based on mood comparison
    @activities = @activities.select { |activity| activity.mood_available?(current_user) }

    # if time range availability given, select acivities available
    # if params["start-time"].present? && params["end-time"].present?
    #   start_time = Time.parse(params["start-time"])
    #   end_time = Time.parse(params["end-time"])
    #   @activities = @activities.select { |activity| activity.time_available?(start_time, end_time) }
    # else
    #   @activities = @activities.select { |activity| activity.currently_available? }
    # end
  end

  def show
    @activity = Action.find(params[:id])
    authorize(@activity)
    @markers = [{ lat: @activity.latitude, lng: @activity.longitude }]
  end
end
