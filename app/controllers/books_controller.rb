class BooksController < ApplicationController
  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      redirect_to books_path
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
