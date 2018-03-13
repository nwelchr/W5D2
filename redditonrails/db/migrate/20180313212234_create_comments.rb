class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.integer :post_id, null: false
      t.integer :user_id, null: false
      t.integer :parent_comment_id

      t.timestamps
    end
    change_column :subs, :description, :text, null: false
  end
end
