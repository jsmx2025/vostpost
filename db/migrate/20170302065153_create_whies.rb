class CreateWhies < ActiveRecord::Migration
  def change
    create_table :whies do |t|
      t.integer :answer_id
      t.text :body
      t.integer :question_id
      t.integer :user_id

      t.timestamps

    end
  end
end
