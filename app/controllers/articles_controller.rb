class ArticlesController < ApplicationController
  before_action :set_article,only:[:edit,:update,:destroy,:show]
  
  def index
    @articles = Article.all.order("created_at desc").page(params[:page]).per(10)
  end

  def new
    @article = Article.new
  end

  def show
    @comments = @article.comments.page(params[:page]).per(10)
  end

  def edit
    @comment = Comment.new
  end

  def update
    comment = Comment.first
    comment.update_attributes(text:params[:article][:text])
    if @article.update(article_params)
        redirect_to articles_path
      else
        render 'edit' 
      end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private 
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:name,:text,:lock_version)
    end
end