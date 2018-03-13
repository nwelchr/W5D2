class AddIndexAndUniquenessConstraintsToUsersAndSubsTables < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :session_token, :string, null: false
    change_column :users, :password_digest, :string, null: false
    change_column :users, :username, :string, null: false, unique: true
    change_column :subs, :user_id, :integer, null: false
    change_column :subs, :title, :string, null: false
    change_column :subs, :description, :string, null: false
    add_index :users, :session_token
    add_index :subs, :user_id
    add_index :posts, :user_id
    add_index :post_subs, :post_id
    add_index :post_subs, :sub_id
  end
end
