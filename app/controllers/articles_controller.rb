class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update ]
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

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def set_article
      @article = Article.find(params.expect(:id))
    end

    def article_params
      params.expect(article: [ :title, :body ])
    end
end
