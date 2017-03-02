class AddVostCountToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :vosts_count, :integer
  end
end
