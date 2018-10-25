class ArticlesController < ApplicationController
  respond_to :html, :json, :js

  before_action :authenticate_user!, except: %i[index show]
  before_action :set_article, only: %i[show edit update destroy]

  def index
    respond_with(@articles = Article.all)
  end

  def show
    authorize @article
    respond_with @article
  end

  def new
    @article = Article.new
    Permission::ACTIONS.each do |action|
      @article.permissions.build(action: action)
    end
  end

  def edit
  end

  def create
    @article = current_user.articles.create(article_params)
    respond_with @article
  end

  def update
    authorize @article
    @article.update(article_params)
    respond_with @article
  end

  def destroy
    @article.destroy
    respond_with(@article, location: articles_url)
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :user_id, permissions_attributes: [:id, :action, user_ids: [] ])
  end
end
