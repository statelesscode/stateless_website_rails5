class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title, index: true
      t.integer :author_user_id, index: true
      t.string :topic, index: true
      t.string :status, index: true
      t.text :body
      t.string :description, index: true, limit: 150 # include in meta tags
      t.text :keywords # include in meta tags, serialize to array
      t.string :minified_link
      t.datetime :published_at
      t.datetime :post_last_modified_at

      t.timestamps
    end
  end
end