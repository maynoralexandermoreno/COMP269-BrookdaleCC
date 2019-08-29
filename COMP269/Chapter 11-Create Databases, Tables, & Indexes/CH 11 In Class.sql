/* Maynor A. Moreno
COMP 269_801RL
CH 10 In Class
Due 11.27.17 */

-- Query 1 - TESTED
use ap;
CREATE INDEX vendors_vendor_zip_code_ix
	ON Vendors (vendor_zip_code);

-- Query 2 - TESTED
use ex;
DROP TABLE IF EXISTS members_groups;
DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS members;
CREATE TABLE members
(
 member_id		INT				PRIMARY KEY		AUTO_INCREMENT,
 first_name		VARCHAR(25)		NOT NULL,
 last_name		VARCHAR(25)		NOT NULL,
 address		VARCHAR(50)		NOT NULL,
 city			VARCHAR(50)		NOT	NULL,
 state			VARCHAR(50)		NOT NULL,
 phone			VARCHAR(20)		NOT NULL
);
CREATE TABLE groups
(
 group_id		INT				PRIMARY KEY		AUTO_INCREMENT,
 group_name		VARCHAR(50)		NOT NULL
);
CREATE TABLE members_groups
(
 member_id		INT				NOT NULL,
 group_id		INT				NOT NUll,
 CONSTRAINT members_groups_fk_member_id
	FOREIGN KEY (member_id)
    REFERENCES members (member_id),
 CONSTRAINT members_groups_fk_group_id
	FOREIGN KEY (group_id)
    REFERENCES groups (group_id)
);

-- Query 3 - TESTED
INSERT INTO members VALUES
	(DEFAULT, 'Skwisgaar', 'Skwigelf', '15 Frozen Place', 'Hoboken', 'NJ', '987-654-3210'),
    (DEFAULT, 'Nathan', 'Explosion', '666 Devils Way', 'Albuquerque', 'NM', '123-456-7890');
INSERT INTO groups VALUES
	(DEFAULT, 'The Annihilators'),
	(DEFAULT, 'The Wizards');
INSERT INTO members_groups VALUES
	(1, 2),
	(2, 1),
    (2, 2);
SELECT g.group_name AS group_name, m.last_name AS last_name, m.first_name AS first_name
FROM Members m Join Members_Groups mg
	ON m.member_id = mg.member_id
    JOIN Groups g
    on mg.group_id = g.group_id
ORDER BY g.group_name, m.last_name, m.first_name;

-- Query 4 - TESTED
ALTER TABLE ex.Members
ADD annual_dues DECIMAL(5,2) DEFAULT 52.50,
ADD payment_date DATE;

-- Query 5 - TESTED
ALTER TABLE ex.Groups
MODIFY  group_name		VARCHAR(50)		NOT NULL	UNIQUE;

INSERT INTO groups VALUES
	(DEFAULT, 'The Wizards');