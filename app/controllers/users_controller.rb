class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @newbook = Book.new
  end

  def show
  end

  def edit
  end
end
