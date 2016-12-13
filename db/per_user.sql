# TODO: STORE BY USER && INST_BOOK_ID. These two values will combine to be unique keys for
#		identifying valueable data.

# Updated ByUser starter query
SELECT
	user_id,
    inst_book_id,
    inst_section_id,
	count(*) as num_attempts,
    count(case when correct = 1 then 1 else null end) as correct,
    count(case when worth_credit = 1 then 1 else null end) as num_credit
FROM opendsa.odsa_exercise_attempts
GROUP BY user_id, inst_book_id;



# select * from opendsa.odsa_exercise_attempts
