class SearchController < ApplicationController
  def index
  end

  def search
  	@keyword = params["keyword"]
  end
end
