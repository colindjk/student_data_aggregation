# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
connection = ActiveRecord::Base.connection()

# Initiates the by_days with data
# TODO: Make this only insert dates.
connection.execute <<-SQL
  INSERT INTO opendsa.by_days (day_of, inst_book_id, inst_section_id, attempts, correct, credited)
  SELECT
      date(time_done) AS day_of,
      inst_book_id,
      inst_section_id,
      count(*) AS attempts,
      count(case when correct = 1 then 1 else null end) AS correct,
      count(case when worth_credit = 1 then 1 else null end) AS credited
  FROM
    opendsa.odsa_exercise_attempts
  GROUP BY dayofyear(time_done), inst_book_id; # Attempts per day, num_correct per day
SQL

# Initiates the by_users with data
# TODO: Make this only insert user_id's.
connection.execute <<-SQL
  INSERT INTO opendsa.by_users (user_id, inst_book_id, inst_section_id, attempts, correct, credited)
  SELECT
    user_id,
    inst_book_id,
    inst_section_id,
    count(*) AS attempts,
    count(case when correct = 1 then 1 else null end) AS correct,
    count(case when worth_credit = 1 then 1 else null end) AS credited
  FROM opendsa.odsa_exercise_attempts
  GROUP BY user_id, inst_book_id;
SQL

