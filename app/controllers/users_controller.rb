class UsersController < ApplicationController
  # def like
  #   @user = User.find(params[:id])
  #   @nickname = @user.nickname
  #   @tweets = @user.tweets
  # end
  
  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @tweets = @user.tweets

  end
end
