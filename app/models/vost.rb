class Vost < ApplicationRecord
  # Direct associations

  has_many   :whyvosts,
             :dependent => :destroy

  has_many   :whies,
             :foreign_key => "answer_id",
             :dependent => :nullify

  belongs_to :post,
             :foreign_key => "question_id"

  belongs_to :user

  # Indirect associations

  # Validations

  validates :response, :presence => { :message => "You Gotta Choose!" }

end
