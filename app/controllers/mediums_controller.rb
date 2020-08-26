class MediumsController < ApplicationController
  def index
    @mediums = policy_scope(Action).where(action_type: 'Medium')
  end
end
