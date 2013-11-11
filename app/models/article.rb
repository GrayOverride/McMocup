class Article < ActiveRecord::Base
	self.inheritance_column = nil
	validates_presence_of :title, :content, :type, :method, :produce, :user_id

	validates_presence_of :user_id, :on => :create
end