class Why < ApplicationRecord
  # Direct associations

  belongs_to :vost

  has_many   :whyvosts,
             :dependent => :nullify

  belongs_to :post

  belongs_to :user

  # Indirect associations

  # Validations

end
