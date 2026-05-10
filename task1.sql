-- Country with the biggest population (id and name of the country)
SELECT id, name, population FROM countries
ORDER BY population DESC
LIMIT 1;

-- Top 10 countries with the lowest population density (names of the countries)
SELECT name, population / surface AS density FROM countries
ORDER BY  density
LIMIT 10;

-- Countries with population density higher than average across all countries
SELECT name, population / surface AS density FROM countries
WHERE population / surface > (SELECT AVG(population / surface) FROM countries);

-- Country with the longest name (if several countries have name of the same length, show all of them)
SELECT name, LENGTH(name) AS length FROM countries
WHERE LENGTH(name) = (SELECT LENGTH(name) FROM countries ORDER BY LENGTH(name) DESC LIMIT 1);

-- All countries with name containing letter “F”, sorted in alphabetical order
SELECT name FROM countries
WHERE name LIKE '%f%' OR name LIKE '%F%'
ORDER BY name;

-- Country which has a population, closest to the average population of all countries
SELECT name, population,
       ABS(population - (SELECT AVG(population) FROM countries)) AS diff
       FROM countries
ORDER BY ABS(population - (SELECT AVG(population) FROM countries))
LIMIT 1;
