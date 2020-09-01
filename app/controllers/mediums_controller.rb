class MediumsController < ApplicationController
  def index
    @mediums = policy_scope(Action).where(action_type: 'Medium')
    @activity = current_user.user_actions.last.action
  end
end
