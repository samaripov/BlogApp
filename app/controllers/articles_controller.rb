class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit ]
  def index
    @articles = Article.all
  end

  def show
   @article = Article.find(params.expect(:id))
  end

  def new
    @article = Article.new
  end

  def edit
  end

  private
    def set_article
      @article = Article.find(params.expect(:id))
    end
end
