/*==DATA BASE TABLE CREATION==*/
CREATE TABLE air_quality_2025 (
    state_code INT,
    county_code INT,
    site_num INT,
    parameter_code INT,
    poc INT,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    datum VARCHAR(50),
    parameter_name VARCHAR(255),
    sample_duration VARCHAR(100),
    pollutant_standard VARCHAR(255),
    metric_used VARCHAR(255),
    method_name TEXT,
    year INT,
    units_of_measure VARCHAR(100),
    event_type VARCHAR(100),
    observation_count INT,
    observation_percent DOUBLE PRECISION,
    completeness_indicator VARCHAR(50),
    valid_day_count INT,
    required_day_count INT,
    exceptional_data_count INT,
    null_data_count INT,
    primary_exceedance_count INT,
    secondary_exceedance_count INT,
    certification_indicator VARCHAR(50),
    num_obs_below_mdl INT,
    arithmetic_mean DOUBLE PRECISION,
    arithmetic_standard_dev DOUBLE PRECISION,
    first_max_value DOUBLE PRECISION,
    first_max_datetime TIMESTAMP,
    second_max_value DOUBLE PRECISION,
    second_max_datetime TIMESTAMP,
    third_max_value DOUBLE PRECISION,
    third_max_datetime TIMESTAMP,
    fourth_max_value DOUBLE PRECISION,
    fourth_max_datetime TIMESTAMP,
    first_no_max_value DOUBLE PRECISION,
    first_no_max_datetime TIMESTAMP,
    second_no_max_value DOUBLE PRECISION,
    second_no_max_datetime TIMESTAMP,
    percentile_99 DOUBLE PRECISION,
    percentile_98 DOUBLE PRECISION,
    percentile_95 DOUBLE PRECISION,
    percentile_90 DOUBLE PRECISION,
    percentile_75 DOUBLE PRECISION,
    percentile_50 DOUBLE PRECISION,
    percentile_10 DOUBLE PRECISION,
    local_site_name TEXT,
    address TEXT,
    state_name VARCHAR(100),
    county_name VARCHAR(100),
    city_name VARCHAR(100),
    cbsa_name VARCHAR(255),
    date_of_last_change DATE
);


SELECT COUNT(*) 
FROM air_quality_2025;


SELECT * FROM state_pollution_summary;

/*--Top 10 States by Average Pollution--*/

SELECT state_name,
       ROUND(AVG(arithmetic_mean)::numeric, 2) AS avg_pollution
FROM air_quality_2025
GROUP BY state_name
ORDER BY avg_pollution DESC
LIMIT 10;

/*--Pollutants with Most Records--*/

SELECT parameter_name,
       COUNT(*) AS total_records
FROM air_quality_2025
GROUP BY parameter_name
ORDER BY total_records DESC;

/*--Cities with Highest Pollution Levels--*/

SELECT city_name,
       MAX(first_max_value) AS highest_pollution
FROM air_quality_2025
GROUP BY city_name
ORDER BY highest_pollution DESC
LIMIT 10;

/*--Average Pollution by Year--*/

SELECT year,
       ROUND(AVG(arithmetic_mean)::numeric, 2) AS yearly_avg_pollution
FROM air_quality_2025
GROUP BY year
ORDER BY year;

/*--Total Observation Count by State--*/

SELECT state_name,
       SUM(observation_count) AS total_observations
FROM air_quality_2025
GROUP BY state_name
ORDER BY total_observations DESC;

/*--Most Common Pollutant Standards--*/

SELECT pollutant_standard,
       COUNT(*) AS standard_count
FROM air_quality_2025
GROUP BY pollutant_standard
ORDER BY standard_count DESC;