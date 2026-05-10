CREATE TABLE continents(
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE countries(
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    surface REAL NOT NULL,
    population INTEGER NOT NULL,
    continent_id BIGSERIAL NOT NULL,

    CONSTRAINT fk_countries_continents FOREIGN KEY (continent_id) REFERENCES continents(id)
);

CREATE TABLE people(
    id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE citizenships(
    id BIGSERIAL PRIMARY KEY,
    country_id BIGSERIAL NOT NULL,
    person_id BIGSERIAL NOT NULL,

    CONSTRAINT fk_citizenships_countries FOREIGN KEY (country_id) REFERENCES countries(id),
    CONSTRAINT fk_citizenships_people FOREIGN KEY (person_id) REFERENCES people(id)
);
