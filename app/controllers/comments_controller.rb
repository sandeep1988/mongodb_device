class CommentsController < ApplicationController
  #before_action :set_comment, only: [:show, :edit, :update, :destroy, :create]
  respond_to :html
  before_action :require_login
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(params[:comment])
    #@comment.save
    redirect_to article_path(@article), :notice => "Comment created!"
  end

  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /articles/1/edit
  def edit
  end

  private
    def require_login
      unless user_signed_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_user_session_path # halts request cycle
      end
    end

 private
   def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:name, :content)
    end
end
