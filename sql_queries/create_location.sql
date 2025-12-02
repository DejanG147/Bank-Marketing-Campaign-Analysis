CREATE TABLE location (
location_id INT,
location_name VARCHAR(50),
location_category VARCHAR(50),
region VARCHAR(50)
);

COPY location
FROM 'D:\Data Analytics\Practice\Project 1\Bank Marketing Campaign Analysis\csv_files\portugal_locations_with_region.csv'
WITH (
    FORMAT csv,
    DELIMITER ',',
    HEADER true
);

ALTER TABLE location
ADD PRIMARY KEY (location_id);

SELECT * from location;

UPDATE location
SET region = 'Ribatejo'
WHERE region IS NULL;

UPDATE location
SET location_category = INITCAP(location_category)
WHERE location_category IS NOT NULL; 

SELECT *
FROM location;


