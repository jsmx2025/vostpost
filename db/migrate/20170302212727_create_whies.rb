class CreateWhies < ActiveRecord::Migration
  def change
    create_table :whies do |t|
      t.integer :user_id
      t.integer :post_id
      t.string :response

      t.timestamps

    end
  end
end
