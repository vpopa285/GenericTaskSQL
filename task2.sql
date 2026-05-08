-- Count of countries for each continent
SELECT ct.name, COUNT(c) FROM countries c
JOIN continents ct ON ct.id = c.continent_id
GROUP BY ct.id, ct.name;

-- Total area for each continent (print continent name and total area), sorted by area from biggest to smallest
SELECT ct.name, SUM(c.surface) AS total_area FROM countries c
JOIN continents ct ON ct.id = c.continent_id
GROUP BY ct.id, ct.name
ORDER BY total_area DESC;

-- Average population density per continent
SELECT ct.name, AVG(c.population / c.surface) AS density FROM continents ct
JOIN countries c ON c.continent_id = ct.id
GROUP BY ct.id, ct.name;

-- For each continent, find a country with the smallest area (print continent name, country name and area)
SELECT ct.name AS continent_name, c.name AS country_name, c.surface FROM continents ct
JOIN countries c ON c.continent_id = ct.id
WHERE c.surface = (SELECT MIN(c2.surface) FROM countries c2 WHERE c2.continent_id = ct.id);

-- Find all continents, which have average country population less than 20 million
SELECT ct.name, AVG(population) AS avg_population FROM continents ct
JOIN countries c ON c.continent_id = ct.id
GROUP BY ct.id, ct.name
HAVING AVG(population) < 20000000;
