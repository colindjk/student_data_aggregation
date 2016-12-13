class ByUser < ActiveRecord::Base

  belongs_to :users, foreign_key: "user_id"
  # CI: belongs_to :user

  #has_many :odsa_user_interactions
  #has_many :odsa_exercise_attempts
  #has_many :odsa_exercise_progresses
  #has_many :odsa_module_progresses
  #has_many :odsa_book_progresses
end
