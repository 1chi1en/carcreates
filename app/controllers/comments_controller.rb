class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)  #同上
    end
  end

  def destroy
    @comment = Article.find(params[:id]) 
    if current_user.id == @article.user_id
      @comment.destroy
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post).merge(user_id: current_user.id, article_id: params[:article_id])
  end
end
