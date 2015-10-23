class ApiProviders < ActiveRecord::Migration
  def change
  	create_table "api_providers" do |t|
  		t.string :name
  		t.string :authURL
  		t.string :client_id

  		t.timestamps null: false
  	end
  end
end
