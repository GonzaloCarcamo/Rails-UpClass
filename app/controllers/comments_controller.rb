class CommentsController < InheritedResources::Base

  def create
    @comment = Comment.new(post: params[:post], user_id: params[:user_id])
    respond_to do |format|
      if @comment.save
        format.js
      end
    end
  end

  private

    def comment_params
      params.require(:post, :user_id)
    end

end
