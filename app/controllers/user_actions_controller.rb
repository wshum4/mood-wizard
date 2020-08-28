class UserActionsController < ApplicationController
  def create
    @user_action = UserAction.new(user: current_user)
    @user_action.action_id = params[:action_id]
    authorize(@user_action)

    if @user_action.save
      redirect_to root_path
    else
      flash[:alert] = "Something went wrong with booking!"
      redirect_to activity_path(params[:action_id])
    end
  end
end
