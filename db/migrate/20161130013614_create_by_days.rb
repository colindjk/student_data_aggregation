class CreateByDays < ActiveRecord::Migration
  def change
    create_table :by_days do |t|
      t

      # TODO: Keep this updated with 
      # app/model/by_day.rb
      has_many :odsa_user_interactions
      has_many :odsa_exercise_attempts
      has_many :odsa_exercise_progresses
      has_many :odsa_module_progresses
      has_many :odsa_book_progresses

      #t.timestamps null: false
    end
  end
end
