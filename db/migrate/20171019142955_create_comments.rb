class CreateComments < ActiveRecord::Migration[5.0]
  def change
  	create_table :comments do |t|
  		t.string :comment_text
  		t.integer :user_id
  		t.integer :commentable_id
  		t.string :commentable_type

  		t.timestamps
  	end
  end
end
