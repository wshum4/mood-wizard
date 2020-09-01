class UserActionsController < ApplicationController
  def create
    @user_action = UserAction.new(user: current_user)
    @user_action.action_id = params[:action_id]
    authorize(@user_action)

    if @user_action.save
      flash[:notice] = "Your activity has been booked."
      if request.headers['HTTP_HOST'] == "localhost:3000"
        redirect_to('http://localhost:3000/#prev-mediums/')
      else
        redirect_to('https://mood-wizard.herokuapp.com/#prev-mediums')
      end
    else
      flash[:alert] = "Something went wrong with booking!"
      redirect_to activity_path(params[:action_id])
    end
  end
end
