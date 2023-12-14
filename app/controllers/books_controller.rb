class BooksController < ApplicationController
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    # Book detail 詳細画面に変更する
    redirect_to books_path
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = current_user
    @book_new = Book.new
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.delete
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
