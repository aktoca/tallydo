class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:index, :new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to(user_path(current_user), notice: 'Welcome to TallyDo '+@user.username)
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private 
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :list_ids)
  end

end
