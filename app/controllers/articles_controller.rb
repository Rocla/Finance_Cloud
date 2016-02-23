class ArticlesController < ApplicationController
  before_action :get_current_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_values)
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
    def get_current_article
      @article = Article.find(params[:id])
    end
end
