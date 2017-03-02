class Why < ApplicationRecord
  # Direct associations

  belongs_to :answer,
             :class_name => "Vost"

  belongs_to :user

  # Indirect associations

  # Validations

end
