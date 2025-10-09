class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to request.referer
  end
  
  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to  request.referer
  end
  
  def index
    @newbook = Book.new
    @user = current_user
    @follow_user = User.find(params[:user_id])
    @follow_users = @follow_user.followings
    @follower_users = @follow_user.followers
  end
  
end
