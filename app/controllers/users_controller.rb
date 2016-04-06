class UsersController < ApplicationController
  before_action :current_user_ref, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :new, :create, :show]
  before_action :require_same_user, only:[:edit, :update, :destroy]


  def index
    @route = "/users"
    @nb_objects = User.count
    @nb_max_pages = (@nb_objects).ceil

    #if no page number on route,
    #page number is nan or
    #page number < 1
    #get page=1
    if params[:page] == nil or
       (params[:page] != nil and !params[:page].match('^[0-9]+$')) or
       (params[:page] != nil and params[:page].to_i < 1)
      #@articles = Article.page(1).per(@article_per_page)
      redirect_to "#{@route}?page=1"
    elsif params[:page].to_i > @nb_max_pages
      redirect_to "#{@route}?page=#{@nb_max_pages}"
      #@articles = Article.page(@nb_max_pages).per(@articles_per_page)
    else
      @users = User.page(params[:page]).per(@nb_obejcts_per_page)
    end
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
  end

  def destroy
    if @user.destroy
      Article.where(user: @user).update_all(user_id: 1)
      if current_user == @user
        flash[:success] = "We are sorry that you leave, your user profile is gone now :("
        session[:user_id] = nil
        redirect_to root_path
      else
        flash[:success] = "This user is gone"
        redirect_to users_path
      end
    end
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
        flash[:error] = "You are not allowed to do that"
        redirect_to user_path(@user.id)
      end
    end
end
