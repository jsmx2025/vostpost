class User < ApplicationRecord
  # Direct associations

  has_many   :whies,
             :dependent => :nullify

  has_many   :vosts,
             :dependent => :nullify

  has_many   :questions,
             :class_name => "Post",
             :dependent => :nullify

  # Indirect associations

  has_many   :whyvosts,
             :through => :whies,
             :source => :whyvosts

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
