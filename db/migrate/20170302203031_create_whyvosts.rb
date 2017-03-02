class CreateWhyvosts < ActiveRecord::Migration
  def change
    create_table :whyvosts do |t|
      t.string :response
      t.integer :why_id
      t.integer :vost_id
      t.integer :post_id

      t.timestamps

    end
  end
end
