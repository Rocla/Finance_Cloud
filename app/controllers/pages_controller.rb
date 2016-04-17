class PagesController < ApplicationController
  def home
    @latest_articles = Article.last(6)
  end
end
