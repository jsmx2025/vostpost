class AddWhyvostCountToWhies < ActiveRecord::Migration[5.0]
  def change
    add_column :whies, :whyvosts_count, :integer
  end
end
