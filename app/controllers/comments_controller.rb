class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def top
  end
  
  def index
    @comments = Comment.all
  end
  
  def new
    if params[:back]
      @comment = Comment.new(comment_params)
    else
      @comment = Comment.new
    end
  end
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comments_path, notice: '新規につぶやきました！'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to comments_path, notice:'編集しました！'
    else
      render 'edit'
    end
  end
  
  def confirm
    @comment = Comment.new(comment_params)
  end

  def destroy
    @comment.destroy
    redirect_to comments_path, notice:'削除しました！'
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
  
  def set_comment
    @comment = Comment.find(params[:id])
  end
end
