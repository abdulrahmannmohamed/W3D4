class CreateAnswerChoicesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :question_id, null: false
      t.text :answer, null: false
      t.timestamps
    end
  end
end