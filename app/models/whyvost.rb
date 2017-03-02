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

end
