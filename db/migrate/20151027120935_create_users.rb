class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :name, null: false
			t.string :password, null: false
			t.string :email, null:false
			t.string :profile_bio 
			t.string :description
		end
	end
end
