class Post < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => :questions_count

  # Indirect associations

  # Validations

end
