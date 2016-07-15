class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, except: :create

  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to journal_entry_path(comment.journal_entry)
    else
      render journal_entry_path(comment.journal_entry)
    end
  end

  def edit

  end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to journal_entry_path(@comment.journal_entry)
    else
      render journal_entry_path(@comment.journal_entry)
    end
  end

  def destroy
    @comment.destroy
    redirect_to journal_entry_path(@comment.journal_entry)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :journal_entry_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
