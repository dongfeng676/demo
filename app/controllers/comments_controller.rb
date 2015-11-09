class CommentsController < ApplicationController
  before_action :set_comment,only:[:edit,:update,:destroy]
  
  def index
    @comments = Comment.all.order("created_at desc").page(params[:page]).per(10)
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.new
  end

  def update
    comment.update_attributes(text:params[:comment][:text])
    if @comment.update(comment_params)
        redirect_to article_comments_path
      else
        render 'edit' 
      end
  end

  def destroy
    @comment.destroy
    redirect_to article_comments_path
  end

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.create(comment_params)
    if @comment.save
      redirect_to action:"show",id:article.id,controller:"articles"
    else
      render 'new'
    end
  end

  private 
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:text)
    end
end