class AddNoCountToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :nos_count, :integer  
  end
end
