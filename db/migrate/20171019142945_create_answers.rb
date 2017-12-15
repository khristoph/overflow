class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
  	create_table :answers do |t|
  		t.string :answer_text
  		t.boolean :best_answer
  		t.integer :user_id, null: false
  		t.integer :question_id, null: false

  		t.timestamps
  	end
  end
end
