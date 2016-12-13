# Representation for 'by_day' table.
class ByDay < ActiveRecord::Base

  # This is simply demonstrating the tables which 'by_day' will
  # be using as resources. The relationships are subject to change
  # while the 'by_day' table remains under construction.
  #has_many :odsa_user_interactions
  #has_many :odsa_exercise_attempts
  #has_many :odsa_exercise_progresses
  #has_many :odsa_module_progresses
  #has_many :odsa_book_progresses

  def self.for_each_book(book)
    return ByDay.group(:day_of).where(inst_book_id: book)
  end

  def self.for_each_section(book_section)
    return ByDay.group(:day_of).where(inst_section_id: book_section)
  end

end
