class Vost < ApplicationRecord
  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

  validates :yes_no, :presence => { :message => "You Gotta Choose!" }

end
