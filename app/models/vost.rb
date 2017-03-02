class Vost < ApplicationRecord
  # Direct associations

  belongs_to :post,
             :foreign_key => "question_id"

  belongs_to :user

  # Indirect associations

  # Validations

  validates :yes_no, :presence => { :message => "You Gotta Choose!" }

end
