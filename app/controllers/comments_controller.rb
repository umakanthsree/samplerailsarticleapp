class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(safeparams)
    redirect_to article_path(@article)
  end

  def destroy
    puts params
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
  def safeparams
    params.require(:comment).permit(:commenter, :body)
  end
end
