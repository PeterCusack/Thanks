class AddGithubAuthKeytoUser < ActiveRecord::Migration
  def change
  	add_column :users, :githubauthkey, :string
  end
end
