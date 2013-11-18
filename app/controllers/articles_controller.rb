class ArticlesController < ApplicationController
  before_filter :authenticate, :except => [:show]
  before_filter :sidebar
  helper_method :sort_column, :sort_direction
  
  
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

private
  def sort_column
    Article.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction 
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
