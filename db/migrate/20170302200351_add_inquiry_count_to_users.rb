class AddInquiryCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :inquiries_count, :integer
  end
end
