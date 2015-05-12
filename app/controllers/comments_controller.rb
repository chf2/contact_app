class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render(json: comment.errors.full_messages,
              status: :unprocessable_entity)
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    if comment
      Comment.destroy(comment)
      render json: comment
    else
      render text: 'Couldn\'t find comment'
    end
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(comment)
      render json: comment
    else
      render (json: comment.errors.full_messages,
               status: :unprocessable_entity)
    end
  end

  private

  def comment_params
    params.require(:comment)
          .permit(:commentable_id, :body, :commenter_id, :commenter_type)
  end

end
