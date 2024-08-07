-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- Find the Company that provides the most jobs in their home city.
SELECT c.name, COUNT(j.id) AS job_number
FROM Companies c
INNER JOIN Job_ads j ON c.name = j.company AND j.city = c.home_city
GROUP BY c.name
ORDER BY job_number DESC
LIMIT 1;

-- Find the top 10 international companies by counting the jobs that provide outside of their home country.
SELECT c.name, COUNT(j.id) AS job_number
FROM Companies c
INNER JOIN Job_ads j ON c.name = j.company AND c.home_country != j.country
GROUP BY c.name
ORDER BY job_number DESC
LIMIT 10;

--Find the top 5 candidates that are more willing to travel by counting the applications outside of their country of residence.
SELECT ca.first_name, ca.last_name, COUNT(j.id) AS job_number
FROM Candidates ca
INNER JOIN Job_applications ja ON ca.id = ja.candidate_id
INNER JOIN Job_ads j ON j.id = ja.job_id AND j.country != ca.country_of_residence
GROUP BY ca.first_name, ca.last_name
ORDER BY job_number DESC
LIMIT 5;

-- Find the candidate that has done the most job applications to one company.
SELECT ca.first_name, ca.last_name, c.name AS company, COUNT(ja.job_id) AS applications
FROM Candidates ca
INNER JOIN Job_applications ja ON ca.id = ja.candidate_id
INNER JOIN Job_ads j ON j.id = ja.job_id
INNER JOIN Companies c ON c.name = j.company
GROUP BY ca.first_name, ca.last_name, company
ORDER BY applications DESC
LIMIT 1;
