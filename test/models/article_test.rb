require "test_helper"

class ArticleTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save article without a title" do
    article = Article.new
    assert_not article.save, "Saved the article without title."
  end
end
