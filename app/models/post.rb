class Post < ApplicationRecord
  # Direct associations

  has_many   :vosts,
             :foreign_key => "question_id",
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => :questions_count

  # Indirect associations

  has_many   :whies,
             :through => :vosts,
             :source => :whies

  # Validations

end
