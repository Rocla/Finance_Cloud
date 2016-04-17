class UsersController < ApplicationController
  before_action :current_user_ref, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :new, :create, :show]
  before_action :require_same_user, only:[:edit, :update, :destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_values)
    if @user.save
      flash[:success] = "Hey #{@user.username}! Welcome to the finance universe!"
      session[:user_id] = @user.id
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_values)
      flash[:success] = "This user profile has been updated"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def show
    @user_articles = @user.articles.paginate(page: params[:page])
    @user_stocks = @user.stocks
  end

  def destroy
    if @user.destroy
      Article.where(user: @user).update_all(user_id: 1)
      if current_user == @user
        flash[:info] = "We are sorry that you leave, your user profile is gone now :("
        session[:user_id] = nil
        redirect_to root_path
      else
        flash[:info] = "This user is gone"
        redirect_to users_path
      end
    end
  end

  def portfolio
    @user_stocks = current_user.stocks
    @user = current_user
  end

  private
    def user_values
      params.require(:user).permit(:username, :email, :password, :rank)
    end
    def current_user_ref
      @user = User.find(params[:id])
    end
    def require_same_user
      if current_user != @user && !admin?
        flash[:danger] = "You are not allowed to do that"
        redirect_to user_path(@user.id)
      end
    end
end
