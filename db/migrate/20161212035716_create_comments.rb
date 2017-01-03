class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :commenter_user_id, index: true
      t.text :body
      t.references :commentable, polymorphic: true
      # closure_tree parent_id
      t.integer :parent_id, index: true

      t.timestamps
    end
  end
end
