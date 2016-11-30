# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
connection = ActiveRecord::Base.connection()

connection.execute <<-SQL
  INSERT INTO opendsa.by_days (day_of, attempts, correct)
  SELECT
    date(time_done) as day_of,
    count(*) attempts,
    count(case when correct = 1 then 1 else null end) as correct
  FROM
    opendsa.odsa_exercise_attempts
  GROUP BY dayofyear(time_done);
SQL

connection.execute <<-SQL
  INSERT INTO opendsa.by_users (user_id, attempts, correct)
  SELECT
    user_id,
  count(*) num_attempts,
  count(case when correct = 1 then 1 else null end) as num_correct
  FROM
  opendsa.odsa_exercise_attempts
  GROUP BY dayofyear(time_done);
SQL

