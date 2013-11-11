class ArticlesController < ApplicationController
  before_filter :authenticate
  
  def index
    @articles = Article.where("user_id = ?", current_user.id)
  end

  def show
    @article = Article.find(params.require(:id))
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :content, :type, :method, :produce))

    @article.user_id = current_user.id

    if @article.save
      redirect_to @article
    else
      render action: "new"
    end
  end

  def edit
    @article = Article.find(params.require(:id))
  end

  def update
    @article = Article.find(params.require(:id))

    if @article.update_attributes(params.require(:article).permit(:title, :content, :type, :method, :produce))
        redirect_to @article 
      else
        render action: "edit"
      end
  end

  def destroy
    @article = Article.find(params.require(:id))
    
    if @article.destroy
      redirect_to articles_path
    else
      redirect_to articles_path
    end
  end
end
