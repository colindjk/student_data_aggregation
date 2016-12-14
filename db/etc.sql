#SELECT day_of, inst_book_id, inst_section_id, interactions
#FROM example_days Days
#LEFT OUTER JOIN (
#	SELECT
#		date(Interactions.action_time) as day_of,
#		inst_book_id,
#		inst_section_id,
#		count(CASE WHEN inst_book_id IS NOT NULL THEN 1 ELSE NULL END) AS interactions
#	FROM opendsa.example_days Days, opendsa.odsa_user_interactions Interactions
#	GROUP BY dayofyear(time_done), inst_book_id, inst_section_id # Attempts per day, num_correct per day
#);

#ALTER TABLE example_days ADD interactions INT NOT NULL;
SET SQL_SAFE_UPDATES=0;
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

#	SELECT
#		count(CASE WHEN inst_book_id IS NOT NULL THEN 1 ELSE NULL END) AS interactions
#	FROM
#		opendsa.odsa_user_interactions Interactions
#	WHERE
#		example_days.day_of = dayofyear(Interactions.action_time),
#		example_days.inst_book_id = Interactions.inst_book_id,
#		example_days.inst_book_id = Interactions.inst_book_id
