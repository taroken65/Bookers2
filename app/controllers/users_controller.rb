class UsersController < ApplicationController
  before_action :check_user, {only: :edit}
  def index
   @users = User.all
   @user = current_user
   @book = Book.new
  end
  
  def show
   @user = User.find(params[:id])
   @books = @user.books
   @book = Book.new
  end
  
  def edit
   @user = User.find(params[:id])
   unless @user == current_user
      redirect_to  user_path(current_user.id)
   end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "successfully"
    redirect_to user_path(@user.id)  
    else
    render("users/edit")
    end
  end
  
 private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def check_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
       redirect_to user_path(current_user.id)
    end
  end 
  
end
