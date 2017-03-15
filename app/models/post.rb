class Post < ApplicationRecord
  # Direct associations


  has_many   :whies,
             :dependent => :destroy

  has_many    :picks,
             :dependent => :destroy

  has_many    :nos,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => :questions_count

  # Indirect associations

  # Validations

  validates :body, :presence => true


end
