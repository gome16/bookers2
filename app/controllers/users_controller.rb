class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  before_action :set_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  
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

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user
   @user = User.find(params[:id])
  end

  def correct_user
    redirect_to user_path(current_user) unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end
end
