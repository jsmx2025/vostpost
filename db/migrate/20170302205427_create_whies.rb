class CreateWhies < ActiveRecord::Migration
  def change
    create_table :whies do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :vost_id
      t.string :body

      t.timestamps

    end
  end
end
