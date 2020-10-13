class FavoritesController < ApplicationController
  def create 
    if user_signed_in?
      Favorite.create(user_id: current_user.id, tweet_id: params[:tweet_id])
      @favorites = Favorite.where(tweet_id: params[:tweet_id])
      @tweet = Tweet.find(params[:tweet_id])
      @user_favorite = @favorites.where(user_id: current_user)
      render 'create.js.haml'
    else
      redirect_to tweet_path(params[:tweet_id]), data: {"turbolinks" => false}, alert: :'お気に入り登録はログインして使用してください'
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, params[:tweet_id])
    if user_signed_in? && current_user.id == @favorite.user_id
      @favorite.destroy
      @favorites = Favorite.where(tweet_id: params[:tweet_id])
      @tweet = Tweet.find(params[:tweet_id])
      @user_favorite = @favorites.where(user_id: current_user)
      render 'destroy.js.haml'
    else
      redirect_to tweet_path(params[:tweet_id]), data: {"turbolinks" => false}, alert: :'お気に入り削除はログインして使用してください'
    end
  end
end
