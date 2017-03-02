class Vost < ApplicationRecord
  # Direct associations

  has_many   :whies,
             :foreign_key => "answer_id",
             :dependent => :nullify

  belongs_to :post,
             :foreign_key => "question_id"

  belongs_to :user

  # Indirect associations

  # Validations

  validates :yes_no, :presence => { :message => "You Gotta Choose!" }

end
