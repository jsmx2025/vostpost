class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.integer :user_id

      t.timestamps

    end
  end
end
