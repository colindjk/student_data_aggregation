class ByDay < ActiveRecord::Base
  #has_many :odsa_user_interactions
  has_many :odsa_exercise_attempts
  has_many :odsa_exercise_progresses
  has_many :odsa_module_progresses
  has_many :odsa_book_progresses

end
