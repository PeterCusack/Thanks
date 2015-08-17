class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :github_name
      t.string :github_email
      t.string :github_avatar_url
      t.string :github_username

      t.timestamps null: false
    end
  end
end
