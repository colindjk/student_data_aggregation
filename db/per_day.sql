DROP TABLE IF EXISTS opendsa.example_days;

# Attempts per day, num_correct per day
CREATE TABLE opendsa.example_days(
	day_of DATE,
    inst_book_id INT,
    inst_section_id INT,
    attempts INT,
    correct INT,
    credited INT,
    interactions INT
);

# Initializer query, inserts the original values of day_of / inst_book_id / inst_section_id
# TODO: Make original insert not insert values aside from the (3) keys, all else queries then
#		follow the same format.
INSERT INTO opendsa.example_days (
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

SET SQL_SAFE_UPDATES=0; # TODO: Verify this is okay!

UPDATE example_days Days
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
		Interactions.day_of = Days.day_of
	AND	Interactions.inst_book_id = Days.inst_book_id
	AND	Interactions.inst_section_id = Days.inst_section_id
SET	Days.interactions = Interactions.interactions;