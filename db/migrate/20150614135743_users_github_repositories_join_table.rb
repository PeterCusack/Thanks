class UsersGithubRepositoriesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :github_repositories do |t|
      t.references :user
      t.references :github_repository
    end
  end
end
