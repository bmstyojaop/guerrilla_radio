class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @tweets = @user.tweets
  end

  def favorites
    @favorites = Favorite.where(user_id: current_user)
  end

end
