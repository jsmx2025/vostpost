class Whyvost < ApplicationRecord
  # Direct associations

  belongs_to :vost

  belongs_to :why,
             :counter_cache => true

  belongs_to :post

  # Indirect associations

  has_one    :user,
             :through => :why,
             :source => :user

  # Validations

  validates :post_id, :presence => true

  validates :vost_id, :presence => true

  validates :why_id, :presence => true

end
