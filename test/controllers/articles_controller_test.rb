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
    assert_select "#article_body_field"
  end

  test "Should create a new article: Success" do
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
    assert_select "#article_body_field"
  end

  test "Should edit the article title" do
    post articles_url, params: { article: { title: @article.title, body: @article.body } }
    last_article = Article.last
    patch article_url(last_article), params: { article: { title: "New Title!", body: "New Body!" } }
    last_article.reload
    assert_equal "New Title!", last_article.title
    assert_equal "New Body!", last_article.body
    assert_redirected_to article_url(last_article)
  end
end
