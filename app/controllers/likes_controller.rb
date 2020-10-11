class LikesController < ApplicationController
  before_action :set_variables

  def like
    like = current_user.likes.new(story_id: @story.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(story_id: @story.id)
    like.destroy
  end

  private

  def set_variables
    @story = Story.find(params[:story_id])
    @id_name = "#like-link-#{@tweet.id}"
  end

end