# frozen_string_literal: true

class ReactionsController < ApplicationController
  before_action :load_reactionable

  def create
    @reaction = @reactionable.reactions.build reaction_params.merge(user_id: current_user.id)
    @reaction.save
    respond_to do |format|
      format.html { redirect_to @reactionable }
      format.js
    end
  end

  def update
    @reaction = @reactionable.reactions.find_by(user_id: current_user.id)
    @reaction.update reaction_params
    respond_to do |format|
      format.html { redirect_to @reactionable }
      format.js
    end
  end

  private

  def load_reactionable
    resource, id = request.original_fullpath.split("/")[1, 2]
    @reactionable = resource.singularize.classify.constantize.find id
  end

  def reaction_params
    params.require(:reaction).permit :action
  end
end
