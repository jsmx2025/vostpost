class Post < ApplicationRecord
  # Direct associations

  has_many   :whyvosts,
             :dependent => :destroy

  has_many   :whies,
             :dependent => :nullify

  has_many   :vosts,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => :questions_count

  # Indirect associations

  # Validations

  validates :body, :presence => true

end
