require "test_helper"

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:first)
  end

  test "Should get index page" do
    get articles_url
    assert_response :success
  end
end
