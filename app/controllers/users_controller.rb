class UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def uptate
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "You have updated user successfully."
      redirect_to book_path
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
