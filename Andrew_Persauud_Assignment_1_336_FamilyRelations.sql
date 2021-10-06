-- DROP TABLE PERSONS;
-- CREATE TABLE PERSONS(
-- ID INT AUTO_INCREMENT,
--    first_name VARCHAR(20),
 --   last_name  VARCHAR(20),
--    gender VARCHAR(5),
--    PRIMARY KEY(ID)
-- );
 --   DESCRIBE PERSONS;
 --   SET SQL_SAFE_UPDATES=0;
  SELECT * FROM PERSONS;
    
 --   INSERT INTO PERSONS(first_name , last_name, gender) VALUES('Andrew', 'Persaud', 'M');
 --   INSERT INTO PERSONS(first_name , last_name, gender) VALUES('Avi', 'Persaud', 'M');
 --   INSERT INTO PERSONS(first_name , last_name, gender) VALUES('John', 'Persaud', 'M');
 --   INSERT INTO PERSONS(first_name , last_name, gender) VALUES('Feiona', 'Persaud', 'F');
 --   INSERT INTO PERSONS(first_name , last_name, gender) VALUES('Runa', 'Ramotar', 'F');
 --   INSERT INTO PERSONS(first_name , last_name, gender) VALUES('Teek', 'Ramotar', 'M');
 --   INSERT INTO PERSONS(first_name , last_name, gender) VALUES('Kevin', 'Ramotar', 'M');
 --  INSERT INTO PERSONS(first_name , last_name, gender) VALUES('Rajpaul', 'Singh', 'M');
 --  INSERT INTO PERSONS(first_name , last_name, gender) VALUES('Chanrooyti', 'Singh', 'F');
 --  INSERT INTO PERSONS(first_name , last_name, gender) VALUES('Kumar', 'Chowdury', 'M');
 --  INSERT INTO PERSONS(first_name , last_name, gender) VALUES('Karen', 'Chowdury', 'F');
	-- INSERT INTO PERSONS(first_name , last_name, gender) VALUES('Samantha', 'Persaud', 'M');
	-- INSERT INTO PERSONS(first_name , last_name, gender) VALUES('Carol', 'Persaud', 'F');
      
	
	DROP TABLE FAMILY;
CREATE TABLE FAMILY(
	ID INT AUTO_INCREMENT,
    father_id INT, 
    mother_id INT,
    first_name VARCHAR(20),
    last_name  VARCHAR(20),
    PRIMARY KEY(ID),
    FOREIGN KEY(ID) REFERENCES PERSONS(ID)
);
	DESCRIBE FAMILY;
    SET SQL_SAFE_UPDATES=0;
    SELECT * FROM FAMILY;
    INSERT INTO FAMILY(father_id, mother_id, first_name, last_name) VALUES(3 , 4 ,  'Andrew', 'Persaud');
    INSERT INTO FAMILY(father_id, mother_id, first_name, last_name) VALUES(3 , 4 , 'Avi', 'Persaud');
    INSERT INTO FAMILY(father_id, mother_id,first_name, last_name) VALUES(10,11,'John', 'Persaud');
    INSERT INTO FAMILY(father_id, mother_id,first_name, last_name) VALUES(8,9,'Feiona', 'Persaud');
    INSERT INTO FAMILY(first_name, last_name) VALUES('Runa', 'Ramotar');
    INSERT INTO FAMILY(first_name, last_name) VALUES('Teek', 'Ramotar');
    INSERT INTO FAMILY(first_name, last_name) VALUES('Kevin', 'Ramotar');
    INSERT INTO FAMILY(first_name, last_name) VALUES('Rajpaul', 'Singh');
    INSERT INTO FAMILY(first_name, last_name) VALUES('Chanrooyti', 'Singh');
	INSERT INTO FAMILY(first_name, last_name) VALUES('Kumar', 'Chowdury');
	INSERT INTO FAMILY(first_name, last_name) VALUES('Karen', 'Chowdury');
    INSERT INTO FAMILY(first_name , last_name) VALUES('Samantha', 'Persaud');
	INSERT INTO FAMILY(first_name , last_name) VALUES('Carol', 'Persaud');
    -- Parents
    SELECT  first_name
    FROM FAMILY
    WHERE father_id = 3 AND mother_id = 4;
    
    -- Grandparents
	SELECT first_name FROM PERSONS WHERE ID = ANY(SELECT  mother_id
    FROM FAMILY
    WHERE ID = ANY(SELECT father_id FROM FAMILY WHERE first_name = 'Andrew' ))
	UNION
    SELECT first_name FROM PERSONS WHERE ID = ANY(SELECT  father_id
    FROM FAMILY
    WHERE ID = ANY(SELECT father_id FROM FAMILY WHERE first_name = 'Andrew' )) 
    UNION
    SELECT first_name FROM PERSONS WHERE ID = ANY(SELECT  mother_id
    FROM FAMILY
    WHERE ID = ANY(SELECT mother_id FROM FAMILY WHERE first_name = 'Andrew' ))
	UNION
    SELECT first_name FROM PERSONS WHERE ID = ANY(SELECT  father_id
    FROM FAMILY
    WHERE ID = ANY(SELECT mother_id FROM FAMILY WHERE first_name = 'Andrew' )) ;
    
	-- Nephews
    SELECT first_name FROM PERSONS WHERE ID = ANY(SELECT ID FROM FAMILY WHERE father_id = ANY(SELECT ID FROM FAMILY WHERE father_id = ANY(SELECT father_id
     FROM FAMILY
     WHERE first_name = 'Andrew') AND NOT first_name = 'Andrew'
     UNION
     (SELECT ID FROM FAMILY WHERE mother_id = ANY(SELECT mother_id
     FROM FAMILY
     WHERE first_name = 'Andrew')AND NOT first_name = 'Andrew'))AND gender = 'M');
     -- Nieces
     SELECT first_name FROM PERSONS WHERE ID = ANY(SELECT ID FROM FAMILY WHERE father_id = ANY(SELECT ID FROM FAMILY WHERE father_id = ANY(SELECT father_id
     FROM FAMILY
     WHERE first_name = 'Andrew') AND NOT first_name = 'Andrew'
     UNION
     (SELECT ID FROM FAMILY WHERE mother_id = ANY(SELECT mother_id
     FROM FAMILY
     WHERE first_name = 'Andrew')AND NOT first_name = 'Andrew'))AND gender = 'F');
    