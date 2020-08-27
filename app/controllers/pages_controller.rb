class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    # Redirects the user to login page if they are not logged in
    redirect_to new_user_session_path if current_user.nil?
    # redirect_to new_mood_path if current_user.last_mood.nil?
    # # Redirects the user to enter a mood if they haven't in 1 hour (in seconds)
    redirect_to new_mood_path if current_user.moods.length > 0 && current_user.last_mood.time_since > 3600
    # Redirects user to graph display
    # Redirects user to past activities
    @current_user_id = current_user.id
    @past_mediums = UserAction.joins(:action).where(user_id: @current_user_id, actions: { action_type: 'Medium' })
    @past_activities = Rating.joins(:action).where(user_id: @current_user_id)
    # Redirect user to past medium
    # @past_medium = current_user.actions.filter do |action|
    #   action.action_type == 'Medium'
    # end
  end
end
