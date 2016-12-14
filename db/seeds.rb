# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ByDay.delete_all
ByUser.delete_all

connection = ActiveRecord::Base.connection()

connection.execute <<-SQL
  SET SQL_SAFE_UPDATES=0; # TODO: Verify this is okay!
SQL

# Initiates the by_days with data
# TODO: Make this only insert dates.
connection.execute <<-SQL
  INSERT INTO opendsa.by_days (
    day_of,
    inst_book_id,
    inst_section_id,
    attempts,
    correct,
    credited
  )
  SELECT
      date(time_done) AS day_of,
      Attempts.inst_book_id,
      Attempts.inst_section_id,
      count(*) attempts,
      count(CASE WHEN correct = 1 THEN 1 ELSE NULL END) AS correct,
      count(CASE WHEN worth_credit = 1 THEN 1 ELSE NULL END) AS credited
  FROM
    opendsa.odsa_exercise_attempts Attempts
  GROUP BY dayofyear(time_done), inst_book_id, inst_section_id; # Attempts per day, num_correct per day
SQL

# Add "interactions" to by_days
connection.execute <<-SQL
  UPDATE by_days
  INNER JOIN (
    SELECT
      date(action_time) as day_of,
      inst_book_id,
      inst_section_id,
      count(CASE WHEN inst_book_id IS NOT NULL THEN 1 ELSE NULL END) AS interactions
    FROM opendsa.odsa_user_interactions
    GROUP BY dayofyear(action_time), inst_book_id, inst_section_id
  )
  Interactions ON
    Interactions.day_of           = by_days.day_of AND 
    Interactions.inst_book_id     = by_days.inst_book_id AND 
    Interactions.inst_section_id  = by_days.inst_section_id
  SET by_days.interactions = Interactions.interactions;
SQL

# Initiates the by_users with data
# TODO: Make this only insert user_id's.
connection.execute <<-SQL
  INSERT INTO opendsa.by_users (
    user_id,
    inst_book_id,
    inst_section_id,
    attempts,
    correct,
    credited
  )
  SELECT
    user_id,
    inst_book_id,
    inst_section_id,
    count(*) as num_attempts,
    count(case when correct = 1 then 1 else null end) as correct,
    count(case when worth_credit = 1 then 1 else null end) as credited
  FROM
    opendsa.odsa_exercise_attempts Attempts
  GROUP BY user_id, inst_book_id, inst_section_id;
SQL

connection.execute <<-SQL
  UPDATE by_users Users
  INNER JOIN (
    SELECT
      user_id,
      inst_book_id,
      inst_section_id,
      count(CASE WHEN inst_book_id IS NOT NULL THEN 1 ELSE NULL END) AS interactions,
      browser_family,
      os_family
    FROM opendsa.odsa_user_interactions
    GROUP BY user_id, inst_book_id, inst_section_id
  )
  Interactions ON
    Interactions.user_id = Users.user_id AND
    Interactions.inst_book_id = Users.inst_book_id AND
    Interactions.inst_section_id = Users.inst_section_id
  SET
    Users.interactions = Interactions.interactions,
    Users.browser_family = Interactions.browser_family,
    Users.os_family = Interactions.os_family;
SQL

