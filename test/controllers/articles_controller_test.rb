require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:first)
  end

  test "Should get index page" do
    get articles_url
    assert_response :success
  end

  test "Should get Article Page" do
    get article_url(@article)
    assert_response :success
    assert_select "#article-title", "#{@article.title}"
  end
end
