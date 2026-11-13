class ArticlesController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch("BLOG_ADMIN_USER", "admin"),
    password: ENV.fetch("BLOG_ADMIN_PASSWORD"), except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.includes(:comments)
    @selected = params[:region].presence
    if Article::REGIONS.include?(@selected)
      @articles = @articles.where(region: @selected)
    end
    @articles = @articles.order(created_at: :desc)
    @visited = @articles.where(trip_status: "Visited")
    @wishlist = @articles.where(trip_status: "Wishlist")
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Article published."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Changes saved."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy!
    redirect_to articles_path, status: :see_other, notice: "Article deleted."
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :region, :destination, :trip_status)
  end
end
