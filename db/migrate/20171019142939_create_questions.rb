class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
  	create_table :questions do |t|
  		t.string :title
  		t.string :question_text
  		t.integer :user_id, null: false

  		t.timestamps
  	end
  end
end
