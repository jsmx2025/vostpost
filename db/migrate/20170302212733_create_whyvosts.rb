class CreateWhyvosts < ActiveRecord::Migration
  def change
    create_table :whyvosts do |t|
      t.integer :vost_id
      t.integer :post_id
      t.integer :why_id
      t.string :response

      t.timestamps

    end
  end
end
