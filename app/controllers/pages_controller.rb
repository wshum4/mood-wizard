class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    # Redirects the user to login page if they are not logged in
    # Redirects the user to enter a mood if they haven't in 1 hour (in seconds)
    redirect_to new_user_session_path if current_user.nil?
    redirect_to new_mood_path if current_user.last_mood.time_since > 3600
    
    
  end
end
