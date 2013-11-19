class Article < ActiveRecord::Base
	belongs_to :user
	self.inheritance_column = nil
	validates_presence_of :title, :content, :type, :method, :produce, :user_id

	validates_presence_of :user_id, :on => :create

	def self.find_articles(keyword, type, method, produce)
		articles = order(:title)
		articles = where("title ILIKE ?", "%#{keyword}%") if keyword.present?
		articles = where("type = ?", "#{type}") if type.present?
		articles = where("method = ?", "#{method}") if method.present?
		articles = where("produce = ?", "#{produce}") if produce.present?
		articles
	end
end