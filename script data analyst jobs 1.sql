-- 1 how many rows in data analyst_ job table, 1793

SELECT *
FROM data_analyst_jobs;

-- 2 Look at first 10  rows, what company is associated with the job in the 10th row, XTO land data analyst

SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- 3 how many postings are in TN? 21; how postings are in TN or KY 27

SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN';

SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY';

-- 4 how many postings are in tn above 4, 3

SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > '4';

-- 5 how many posting in the dataset have a review count between 500 and 1000. 151

SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

-- 6 show avg star rating of each company in each state. state out put should list as 'state' and the star rating as 'avg_rating'. which state has the highest avg rating
-- 6 answer NE with 4.199

SELECT location AS state,AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating desc;

-- 7 select unique job titles  from the table how many are there 881

SELECT DISTINCT(title)
FROM data_analyst_jobs;

-- 8 how many unique job tutles are there in california 230

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE location = 'CA';

-- 9 name each company and its avg star rating for all companies with more then 5000 reviews
-- how many have more then 5000 reviews 41

SELECT company,ROUND(AVG(star_rating),2)
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company;

-- 10 add order by for highest to lowest star rating.  which company has highest star rating and what is the highest rating
-- gen motors at 4.2 avg star rating

SELECT company,ROUND(AVG(star_rating),2) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY avg_star_rating desc;

-- 11 Find all the job titles that contain the word â€˜Analystâ€™. How many different job titles are there? 774

SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

--12 How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common? 4, Tableau

SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%analy%';

-- bonus You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted 
-- longer than 3 weeks.
-- - Disregard any postings where the domain is NULL.
-- - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top.
-- - Which industries are in the top 4?

SELECT domain,COUNT(*) AS hard_to_fill_jobs
FROM data_analyst_jobs
WHERE skill ILIKE '%sql%'
	AND domain IS NOT null
	AND days_since_posting > 21
GROUP BY domain
ORDER BY hard_to_fill_jobs Desc
LIMIT 4;