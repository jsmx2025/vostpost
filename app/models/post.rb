class Post < ApplicationRecord
  # Direct associations

  has_many   :whyvosts,
             :dependent => :destroy

  has_many   :whies

  has_many   :vosts,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => :questions_count

  # Indirect associations

  # Validations

end
