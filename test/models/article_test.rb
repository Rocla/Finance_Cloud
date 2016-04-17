require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  setup do
    $article = articles(:valid_one)
  end
  
  test "can save article" do
	article = Article.new(title: "beautiful title", content: "holy moly, this is just content for testing purpose", user_id: 1)
    assert article.save, "Error : fail saving valid article"
  end
  
  test "can save article with same title" do
	article = Article.new(title: $article.title, content: "holy moly, this is just content for testing purpose", user_id: 1)
    assert article.save, "Error : fail saving valid article"
  end
  
  test "can save article with same content" do
	article = Article.new(title: "beautiful tittle", content: $article.content, user_id: 1)
    assert article.save, "Error : fail saving valid article"
  end
  
  test "title too short" do
	article = Article.new(title: "a" * 2, content: "holy moly, this is just content for testing purpose", user_id: 1)
    assert_not article.save, "Error : success saving unvalid article"
  end
  
  test "title too long" do
	article = Article.new(title: "a" * 51, content: "holy moly, this is just content for testing purpose", user_id: 1)
    assert_not article.save, "Error : success saving unvalid article"
  end
  
  test "content too short" do
	article = Article.new(title: "beautiful tittle", content: "a" * 9, user_id: 1)
    assert_not article.save, "Error : success saving unvalid article"
  end
  
  test "content too long" do
	article = Article.new(title: "beautiful tittle", content: "a" * 501, user_id: 1)
    assert_not article.save, "Error : success saving unvalid article"
  end
  
end
