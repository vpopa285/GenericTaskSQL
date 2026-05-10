-- Person with the biggest number of citizenships
SELECT first_name || ' ' || last_name AS name, COUNT(ci.country_id) AS citizenships FROM citizenships ci
JOIN people p ON p.id = ci.person_id
GROUP BY p.id
ORDER BY citizenships DESC
LIMIT 1;

-- All people who have no citizenship
SELECT first_name || ' ' || last_name AS name, COUNT(ci.country_id) AS citizenships FROM citizenships ci
JOIN people p ON p.id = ci.person_id
GROUP BY p.id
HAVING COUNT(ci.country_id) = 0;

-- Country with the least people in People table
SELECT c.name, COUNT(ci.person_id) AS people_count FROM countries c
JOIN citizenships ci ON ci.country_id = c.id
GROUP BY c.id, c.name
ORDER BY people_count
LIMIT 1;

-- Continent with the most people in People table
SELECT ct.name, COUNT(DISTINCT ci.person_id) AS people_count FROM continents ct
JOIN countries c ON c.continent_id = ct.id
JOIN citizenships ci ON ci.country_id = c.id
GROUP BY ct.id, ct.name
ORDER BY people_count DESC
LIMIT 1;

-- Find pairs of people with the same name - print 2 ids and the name
SELECT p1.id AS person1_id, p2.id AS person2_id, p1.first_name AS shared_name
FROM people p1
JOIN people p2 ON p1.first_name = p2.first_name AND p1.id < p2.id
ORDER BY shared_name, p1.id;
