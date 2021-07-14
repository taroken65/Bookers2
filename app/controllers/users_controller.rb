class UsersController < ApplicationController
  def show
   @user = User.find(params[:id])
   @book = Book.find(params[:id])
  end
  
  def index
   @users = User.all
   @user = User.new
  end
end
