class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]

  def index
    @users = User.all
    @user = current_user
    @newbook = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @newbook = Book.new
  end
end
