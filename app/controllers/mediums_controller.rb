class MediumsController < ApplicationController
  def show
    @mediums = policy_scope(Action).where(type: 'Medium')
  end
end
