class UsersController < ApplicationController
  before_action :get_current_user, only: [:edit, :update, :show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_values)
    if @user.save
      flash[:success] = "Hey #{@user.username}! Welcome to the finance universe!"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_values)
      flash[:success] = "Your profile has been updated"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def show
  end

  private
    def user_values
      params.require(:user).permit(:username, :email, :password)
    end
    def get_current_user
      @user = User.find(params[:id])
    end
end
