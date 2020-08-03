class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(tweet_id: params[:tweet_id])
    @like.save
    # redirect_back(fallback_location: root_path)
    result = [done: "save",user_id: current_user.id, tweet_id: params[:tweet_id]]
    render :json => result
  end

  def destroy
    @like = Like.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    @like.destroy
    # redirect_back(fallback_location: root_path)
    result = [done: "destroy",user_id: current_user.id, tweet_id:params[:tweet_id]]
    render :json => result
  end
end
