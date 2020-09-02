class MediumsController < ApplicationController
  def index
    @mediums = policy_scope(Action).where(action_type: 'Medium')
    @activity = current_user.user_actions.last.action
    if flash[:booking]
      @action = Action.find(flash[:booking]["action_id"])
    end
  end
end
