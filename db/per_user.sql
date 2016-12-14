# TODO: STORE BY USER && INST_BOOK_ID. These two values will combine to be unique keys for
#		identifying valueable data.
DROP TABLE IF EXISTS opendsa.example_users;

# Attempts per day, num_correct per day
CREATE TABLE opendsa.example_users(
	user_id INT,
    inst_book_id INT,
    inst_section_id INT,
    attempts INT,
    correct INT,
    credited INT,
    interactions INT,
    browser_family varchar(50),
    os_family varchar(50)
);

# Updated ByUser starter query
INSERT INTO opendsa.example_users (
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

SELECT 
	user_id,
    inst_book_id,
    inst_section_id,
    count(CASE WHEN inst_book_id IS NOT NULL THEN 1 ELSE NULL end) as interactions
FROM opendsa.odsa_user_interactions
GROUP BY user_id, inst_book_id, inst_section_id;

SET SQL_SAFE_UPDATES=0; # TODO: Verify this is okay!

UPDATE example_users Users
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
		Interactions.user_id = Users.user_id
	AND	Interactions.inst_book_id = Users.inst_book_id
	AND	Interactions.inst_section_id = Users.inst_section_id
SET	
	Users.interactions = Interactions.interactions,
	Users.browser_family = Interactions.browser_family,
	Users.os_family = Interactions.os_family;
# select * from opendsa.odsa_exercise_attempts
