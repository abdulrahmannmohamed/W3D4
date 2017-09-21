class CreatePollsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :polls do |t|
      t.text :title, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
