class PagesController < ApplicationController
  def home
    @latest_articles = Article.last(3)
  end
end
