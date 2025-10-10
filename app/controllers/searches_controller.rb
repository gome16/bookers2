class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @user = current_user
    @newbook = Book.new
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    
    if @model  == "user"
      @users = User.search_for(@content, @method)
    else
      @books = Book.search_for(@content, @method)
    end
  end
end
