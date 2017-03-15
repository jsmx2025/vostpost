class No < ApplicationRecord
  # direct associations

belongs_to :user

belongs_to :post,
           :counter_cache => true

validates :user_id, :presence => true, :uniqueness => { :scope => :post }
end
