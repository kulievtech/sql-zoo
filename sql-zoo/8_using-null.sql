            -- teacher
-- id	    dept	    name	        phone	    mobile
-- 101	    1	        Shrivell	    2753	    07986 555 1234
-- 102	    1	        Throd	        2754	    07122 555 1920
-- 103	    1	        Splint	        2293	
-- 104		            Spiregrain	    3287	
-- 105	    2	        Cutflower	    3212	    07996 555 6574
-- 106		            Deadyawn	    3345	


                -- dept
--      id	                name
--      1	                Computing
--      2	                Design
--      3	                Engineering





-- Teachers and Departments
-- The school includes many departments. Most teachers work exclusively for a single department. Some teachers have no department.

-- Selecting NULL values.

-- NULL, INNER JOIN, LEFT JOIN, RIGHT JOIN



-- 1:

-- List the teachers who have NULL for their department.

-- Why we cannot use =
    -- You might think that the phrase dept=NULL would work here but it doesn't you can use the phrase dept IS NULL


SELECT t.name
FROM teacher t
LEFT JOIN dept d
ON t.dept = d.id
WHERE t.dept IS NULL;



-- 2:

-- Note the INNER JOIN misses the teachers with no department and the departments with no teacher.

SELECT teacher.name, dept.name
FROM teacher INNER JOIN dept
ON (teacher.dept=dept.id)


-- 3:

-- Use a different JOIN so that all teachers are listed.


SELECT t.name, d.name
FROM teacher t
LEFT JOIN dept d
ON t.dept = d.id;



-- 4:

-- Use a different JOIN so that all departments are listed.

SELECT t.name, d.name
FROM teacher t
RIGHT JOIN dept d
ON t.dept = d.id;


-- 5:

-- Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'


SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher;





-- 6: 

-- Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.


SELECT t.name, COALESCE(d.name, "None")
FROM teacher t
LEFT JOIN dept d
ON t.dept = d.id;





-- 7: 


-- Use COUNT to show the number of teachers and the number of mobile phones.



SELECT COUNT(id), COUNT(mobile)
FROM teacher;



-- 8:



-- Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.




SELECT d.name, count(t.id)
FROM teacher t
RIGHT JOIN dept d
ON t.dept = d.id
GROUP BY d.name;



-- 9:


-- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.



SELECT name,
CASE
  WHEN dept IN (1, 2) THEN "Sci"
  ELSE "Art"
End
FROM teacher;



-- 10:


-- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.




SELECT name,
CASE
  WHEN dept IN (1, 2) THEN "Sci"
  WHEN dept = 3 THEN "Art"
  ELSE "None"
End
FROM teacher;