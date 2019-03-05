USE treasurehunters;
#TASK 2
#Query 1

SELECT firstName, lastName, dob, gender, email

FROM player

WHERE suburb LIKE '%Sunnybank%';

#Query 2

SELECT DISTINCT username, SUM(cost) AS spent

FROM purchase

GROUP BY username DESC;

#Query 3

SELECT username, phonenumber

FROM phoneNumber

WHERE username = (SELECT username

		FROM player

		WHERE dob <= ALL(SELECT dob

				FROM player));

#Query 4

SELECT badgeName, firstName, lastName, email

FROM badge b
LEFT JOIN purchase p ON b.badgeID=p.badgeID

LEFT JOIN player u ON u.username=p.username
ORDER BY badgename ASC, firstName ASC, lastName ASC;

#Query 5

SELECT DISTINCT count(p.questID) as numOfQuests, username, progress 

FROM playerprogress p

WHERE p.progress = 'complete' AND questID IN (SELECT questID

						FROM treasure

						WHERE p.questID=questID AND type = 'common')

GROUP BY username ASC;

#-------------------------------------------------
#-------------------------------------------------

#TASK 3
#INSERT

INSERT INTO badge (badgeName, badgeDescription)

VALUES ('Fools Gold', 'Trickiest trickster in all the seas');


SET SQL_SAFE_UPDATES = 0; #Ensure to turn off safe update mode

#DELETE

DELETE FROM playerprogress

WHERE progress = 'inactive';

#UPDATE

UPDATE player

SET streetNumber = '72', streetName = 'Evergreen Terrace', suburb = 'Springfield'

WHERE lastName = 'Smith' AND streetNumber = '180' AND streetName = 'Zelda Street' AND suburb = 'Linkburb';

#-------------------------------------------------
#-------------------------------------------------

#TASK 4
#CREATE INDEX

CREATE INDEX webpageIndex

ON treasure(webpage);

#CREATE VIEW

CREATE VIEW viewNoQuestsDone AS

SELECT firstName, lastName, creationDateTime

FROM player p

WHERE p.username NOT IN(SELECT DISTINCT username

			FROM playerprogress

			WHERE progress IN('complete'));
#-------------------------------------------------

#TASK 5
#A
GRANT INSERT ON player TO nikki;

#B
GRANT DELETE ON player TO nikki;

#C
REVOKE INSERT ON player FROM phil;

#D
REVOKE DELETE ON player FROM phil;