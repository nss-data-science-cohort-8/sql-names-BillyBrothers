-- ## SQL Names


SELECT * 
FROM names 
LIMIT 5;

-- Save a script containing the query you used to answer each question.

-- 1. How many rows are in the names table?

SELECT COUNT(*)
FROM names

-- 2. How many total registered people appear in the dataset?

SELECT SUM(num_registered)
FROM names 

-- 3. Which name had the most appearances in a single year in the dataset?

SELECT *
FROM names
ORDER BY num_registered DESC

-- 4. What range of years are included?

SELECT MAX(year) - MIN(year)
FROM names


-- 5. What year has the largest number of registrations?

SELECT year, num_registered
FROM names
ORDER BY num_registered DESC

-- 6. How many different (distinct) names are contained in the dataset?

SELECT COUNT(DISTINCT name)
FROM names

-- 7. Are there more males or more females registered?

SELECT gender, COUNT(gender)
FROM names
GROUP BY gender

-- 8. What are the most popular male and female names overall (i.e., the most total registrations)?

SELECT DISTINCT name, gender, num_registered
FROM names
GROUP BY name, gender, num_registered
ORDER BY num_registered DESC

-- 9. What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?
SELECT *
FROM names
WHERE year BETWEEN 2000 AND 2009
ORDER BY num_registered DESC

-- 10. Which year had the most variety in names (i.e. had the most distinct names)?

SELECT COUNT(DISTINCT name), year
FROM names
GROUP BY year
ORDER BY count DESC
LIMIT 1

-- 11. What is the most popular name for a girl that starts with the letter X?

SELECT COUNT(name), name
FROM names
WHERE name LIKE ('X%') AND gender = 'F'
GROUP BY name
ORDER BY count DESC



-- 12. Write a query to find all (distinct) names that start with a 'Q' but whose second letter is not 'u'.

SELECT DISTINCT name
FROM names
WHERE name LIKE ('Q%') AND name NOT LIKE ('%u%')


-- 13. Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question.

SELECT SUM(num_registered) AS total_registered, name
FROM names
WHERE name = 'Stephen' OR name = 'Steven'
GROUP BY name


-- 14. Find all names that are "unisex" - that is all names that have been used both for boys and for girls.

SELECT name
FROM names
GROUP BY name
HAVING COUNT(DISTINCT gender) > 1

-- 15. Find all names that have made an appearance in every single year since 1880.

select name
FROM names
GROUP BY name
HAVING COUNT(name) = 138

-- 16. Find all names that have only appeared in one year.

SELECT name
FROM names
GROUP BY name
HAVING COUNT(DISTINCT year) = 1

-- 17. Find all names that only appeared in the 1950s.

SELECT name
FROM names
GROUP BY name
HAVING MIN(Year) >= 1950 AND MAX(YEAR) <= 1959


-- 18. Find all names that made their first appearance in the 2010s.

SELECT name
FROM names
GROUP BY name
HAVING MIN(year) >= 2010


-- 19. Find the names that have not be used in the longest.

SELECT name
FROM names
GROUP BY name
ORDER BY MAX(year)


-- 20. Come up with a question that you would like to answer using this dataset. Then write a query to answer this question.

How long is the longest name(s)? and how long is the shortest(s) names?

SELECT MAX(LENGTH(name)) AS name_length, name
FROM names
GROUP BY name
ORDER BY name_length DESC

SELECT MAX(LENGTH(name)) as name_length, name
FROM names
GROUP BY name
ORDER BY name_length
