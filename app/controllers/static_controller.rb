class StaticController < ApplicationController
  layout :resolve_layout
  before_filter :sidebar, :only => [:about_app]

  def privacy
  end

  def about
  end

  def about_app
  	render :about
  end

  def terms
  end

  private
  def resolve_layout
  	case action_name
  	when "privacy", "about", "terms"
  		"acount"
  	when "about_app"
  		"application"
  	else
  		"application"
  	end
  end
end
