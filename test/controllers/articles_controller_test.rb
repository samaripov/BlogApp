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

  test "Should get a new Article Page" do
    get new_article_url
    assert_response :success
    assert_select "#page-title", "Writting a new article"
    assert_select "#article_title_field"
  end

  test "Should create a new article" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { title: @article.title, body: "" } }
    end

    created_article = Article.last
    assert_redirected_to created_article
  end

  test "Should get the edit article page" do
    get edit_article_url(@article)
    assert_response :success
    assert_select "#page-title", "Editing \"#{@article.title}\" article"
    assert_select "#article_title_field"
  end
end
