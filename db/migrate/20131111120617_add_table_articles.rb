class AddTableArticles < ActiveRecord::Migration
  def change
  	create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :type
      t.string :method
      t.string :produce
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_reference :articles, :user, index: true
  end
end
