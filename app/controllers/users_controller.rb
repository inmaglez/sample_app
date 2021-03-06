class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) # 1
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) # Not the final implementation!
    if @user.save # Handle a successful save.
      sign_in @user
      redirect_to @user
      flash[:success] = "Welcome to the Sample App!"
    else
      render 'new'
    end
  end

  private # internal to Users controller
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end


