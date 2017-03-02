class Vost < ApplicationRecord
  # Direct associations

  has_many   :whyvosts,
             :dependent => :destroy

  has_many   :whies,
             :dependent => :destroy

  belongs_to :post,
             :counter_cache => true

  belongs_to :user

  # Indirect associations

  # Validations

  validates :post_id, :presence => true

  validates :response, :presence => { :message => "You Gotta Choose!" }

end
