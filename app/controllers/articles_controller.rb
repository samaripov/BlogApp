class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit ]
  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
  end

  private
    def set_article
      @article = Article.find(params.expect(:id))
    end

    def article_params
      params.expect(article: [ :title, :body ])
    end
end
