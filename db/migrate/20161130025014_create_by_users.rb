class CreateByUsers < ActiveRecord::Migration
  def change
    create_table :by_users do |t|
      t.string :user, null: false

      # TODO: Keep this updated with 
      # app/model/by_user.rb
      has_and_belong_to_many :users
      has_many :odsa_user_interactions
      has_many :odsa_exercise_attempts
      has_many :odsa_exercise_progresses
      has_many :odsa_module_progresses
      has_many :odsa_book_progresses
      # t.timestamps null: false
      # As this table is recording information by_user over a long
      # period of time (aggregation), it will not have timestamps.
    end
  end
end
