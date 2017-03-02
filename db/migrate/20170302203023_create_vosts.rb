class CreateVosts < ActiveRecord::Migration
  def change
    create_table :vosts do |t|
      t.string :response
      t.integer :question_id
      t.integer :user_id

      t.timestamps

    end
  end
end
