class UsersController < ApplicationController
  before_action :is_matching_login_user_edit, only: [:edit]
  before_action :is_matching_login_user_update, only: [:update]

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user_edit
    user = User.find(params[:id])
    redirect_to(current_user) unless user == current_user
  end

  def is_matching_login_user_update
    user = User.find(params[:id])
    redirect_to(books_path) unless user == current_user
  end
end
