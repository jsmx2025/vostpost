class Vost < ApplicationRecord
  # Direct associations

  has_many   :whyvosts,
             :dependent => :destroy

  has_many   :whies,
             :dependent => :nullify

  belongs_to :post

  belongs_to :user

  # Indirect associations

  # Validations

  validates :response, :presence => { :message => "You Gotta Choose!" }

end
