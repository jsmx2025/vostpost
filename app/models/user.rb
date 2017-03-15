class User < ApplicationRecord
  # Direct associations

  has_many   :whies,
             :dependent => :destroy

  has_many   :picks,
             :dependent => :destroy

  has_many   :nos,
             :dependent => :destroy

  has_many   :questions,
             :class_name => "Post",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
