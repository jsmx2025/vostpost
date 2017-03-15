class Why < ApplicationRecord
  # Direct associations

  belongs_to :post

  belongs_to :user

  # Indirect associations

  # Validations

  validates :post_id, :presence => true

end
