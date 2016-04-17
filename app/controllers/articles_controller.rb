class ArticlesController < ApplicationController
  before_action :current_article_ref, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_article_owner, only:[:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_values)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article was created"
      #flash[:notice] = "render plain: params[:article].inspect"
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_values)
      flash[:success] = "Article was updated"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    if @article.destroy
      flash[:success] = "Article was deleted"
    end
    redirect_to articles_path
  end

  private
    def article_values
      params.require(:article).permit(:title, :content)
    end
    def current_article_ref
      @article = Article.find(params[:id])
    end
    def require_article_owner
      if current_user != @article.user && !moderator?
        flash[:error] = "You are not allowed to do that"
        redirect_to article_path(@article)
      end
    end
end
