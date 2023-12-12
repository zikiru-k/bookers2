class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    # Book detail 詳細画面に変更する
    redirect_to book_path
  end

  def index
  end

  def show
  end

  private
  def book_params
    params.require(:book).permit(:title, :Opinion)
  end
end
