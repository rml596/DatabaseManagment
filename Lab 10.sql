/*Question 1
func1on PreReqsFor(courseNum) - Returns the immediate prerequisites for the passed-in course number.*/

CREATE OR REPLACE FUNCTION PreRequesFor(int, refcursor) RETURNS refcursor AS
$$
DECLARE 
	courseInput int := $1;
	resultSet refcursor := $2;
BEGIN
	OPEN resultSet FOR
		SELECT courseNum, preReqNum
		FROM Prerequisites, Courses
		WHERE num = PreReqNum
		AND courseInput = courseNum;
	RETURN resultSet;
END;

$$
LANGUAGE plpgsql;

SELECT PreRequesFor(221, 'results');
FETCH ALL FROM results;


/*Question 2
func1on IsPreReqFor(courseNum) - Returns the courses for which the passed-in course number is an immediate pre-requisite.*/

CREATE OR REPLACE FUNCTION IsPreReqsFor(int, refcursor) RETURNS refcursor AS
$$
DECLARE 
	courseInput int := $1;
	resultSet refcursor := $2;
BEGIN
	OPEN resultSet FOR
		SELECT preReqNum, courseNum
		FROM Prerequisites, Courses
		WHERE courseNum = num
		AND courseInput = PreReqNum;
	RETURN resultSet;
END;

$$
LANGUAGE plpgsql;

SELECT IsPreReqsFor(220, 'results');
FETCH ALL FROM results;