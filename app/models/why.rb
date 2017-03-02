class Why < ApplicationRecord
  # Direct associations

  belongs_to :answer,
             :class_name => "Vost"

  belongs_to :user

  # Indirect associations

  has_one    :post,
             :through => :answer,
             :source => :post

  # Validations

end
