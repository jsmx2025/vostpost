class CreateVosts < ActiveRecord::Migration
  def change
    create_table :vosts do |t|
      t.boolean :yes_no
      t.integer :question_id
      t.integer :user_id

      t.timestamps

    end
  end
end
