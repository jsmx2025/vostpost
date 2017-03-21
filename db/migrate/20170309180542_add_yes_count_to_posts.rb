class AddPickCountToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :picks_count, :integer
  end
end
