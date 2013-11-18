class SearchController < ApplicationController
  def index
  end

  def search
  	@articles = Article.find_articles(params["keyword"], params["type"], params["method"], params["produce"])
  	@keyword = params["keyword"]
  	@type = params["type"]
  	@method = params["method"]
  	@produce = params["produce"]
  end
end
