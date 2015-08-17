class CreateGithubRepositories < ActiveRecord::Migration
  def change
    create_table :github_repositories do |t|
      t.string :name
      t.string :url

      t.timestamps null: false
    end
  end
end
