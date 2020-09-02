class UserActionsController < ApplicationController
  def create
    @user_action = UserAction.new(user: current_user)
    @user_action.action_id = params[:action_id]
    authorize(@user_action)

    if @user_action.save
      flash[:notice] = "Your activity has been booked and it is confirmed."
      if true#request.headers['HTTP_HOST'] == "localhost:3000"
        redirect_to mediums_path(action_id: "#{@user_action.action_id}")
      else
        redirect_to('https://mood-wizard.herokuapp.com/mediums', action_id: "#{@user_action.action_id}")
      end
    else
      flash[:alert] = "Something went wrong with booking!"
      redirect_to activity_path(params[:action_id])
    end
  end
end
