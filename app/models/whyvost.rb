class Whyvost < ApplicationRecord
  # Direct associations

  belongs_to :why,
             :counter_cache => true

  # Indirect associations

  has_one    :user,
             :through => :why,
             :source => :user

  # Validations

end
