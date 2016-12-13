# Attempts per day, num_correct per day
select
    date(time_done) as day_of,
    inst_book_id,
    count(*) num_attempts,
    count(case when correct = 1 then 1 else null end) as num_correct
from
	opendsa.odsa_exercise_attempts
group by dayofyear(time_done), inst_book_id;# Attempts per day, num_correct per day

# TODO: STORE BY USER && INST_BOOK_ID. These two values will combine to be unique keys for
#		identifying valueable data.

# Updated ByUser starter query
#SELECT
#	user_id,
#    date(time_done) as day_of,
#	count(*) as num_attempts,
#    count(case when worth_credit = 1 then 1 else null end) as num_credit,
#    count(case when correct = 1 then 1 else null end) as num_correct
#FROM opendsa.odsa_exercise_attempts
#GROUP BY user_id;