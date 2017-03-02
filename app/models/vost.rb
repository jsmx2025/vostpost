class Vost < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :yes_no, :presence => { :message => "You Gotta Choose!" }

end
