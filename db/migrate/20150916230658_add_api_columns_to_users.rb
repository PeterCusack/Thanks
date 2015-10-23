class AddApiColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :twitter_name, :string
    add_column :users, :twitter_authkey, :string
    add_column :users, :venmo_name, :string
    add_column :users, :venmo_authkey, :string
  end
end
