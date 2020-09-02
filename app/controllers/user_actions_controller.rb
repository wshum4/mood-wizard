class UserActionsController < ApplicationController
  def create
    @user_action = UserAction.new(user: current_user)
    @user_action.action_id = params[:action_id]
    authorize(@user_action)

    if @user_action.save
      flash[:booking] = { action_id: @user_action.action_id }
      redirect_to mediums_path(action_id: "#{@user_action.action_id}")
    else
      flash[:alert] = "Something went wrong with booking!"
      redirect_to activity_path(params[:action_id])
    end
  end
end
