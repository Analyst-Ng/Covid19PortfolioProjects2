DROP TABLE IF EXISTS CovidDeaths;

CREATE TABLE CovidDeaths (
    iso_code NVARCHAR(50),
    continent NVARCHAR(50),
    location NVARCHAR(255),
    date NVARCHAR(50),
    population NVARCHAR(50),
    total_cases NVARCHAR(50),
    new_cases NVARCHAR(50),
    new_cases_smoothed NVARCHAR(50),
    total_deaths NVARCHAR(50),
    new_deaths NVARCHAR(50),
    new_deaths_smoothed NVARCHAR(50),
    total_cases_per_million NVARCHAR(50),
    new_cases_per_million NVARCHAR(50),
    new_cases_smoothed_per_million NVARCHAR(50),
    total_deaths_per_million NVARCHAR(50),
    new_deaths_per_million NVARCHAR(50),
    new_deaths_smoothed_per_million NVARCHAR(50),
    reproduction_rate NVARCHAR(50),
    icu_patients NVARCHAR(50),
    icu_patients_per_million NVARCHAR(50),
    hosp_patients NVARCHAR(50),
    hosp_patients_per_million NVARCHAR(50),
    weekly_icu_admissions NVARCHAR(50),
    weekly_icu_admissions_per_million NVARCHAR(50),
    weekly_hosp_admissions NVARCHAR(50),
    weekly_hosp_admissions_per_million NVARCHAR(50)
);

BULK INSERT CovidDeaths
FROM 'C:\Temp\covid.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK,
    CODEPAGE = '65001'
);

SELECT COUNT(*) FROM CovidDeaths;

SELECT TOP 10 *
FROM CovidDeaths;

SELECT *
FROM CovidDeaths;

DROP TABLE IF EXISTS CovidDeaths_Clean;

SELECT
    iso_code,
    continent,
    location,

    TRY_CONVERT(DATE, date, 103) AS date,

    TRY_CONVERT(FLOAT, population) AS population,
    TRY_CONVERT(FLOAT, total_cases) AS total_cases,
    TRY_CONVERT(FLOAT, new_cases) AS new_cases,
    TRY_CONVERT(FLOAT, new_cases_smoothed) AS new_cases_smoothed,
    TRY_CONVERT(FLOAT, total_deaths) AS total_deaths,
    TRY_CONVERT(FLOAT, new_deaths) AS new_deaths,
    TRY_CONVERT(FLOAT, new_deaths_smoothed) AS new_deaths_smoothed,
    TRY_CONVERT(FLOAT, total_cases_per_million) AS total_cases_per_million,
    TRY_CONVERT(FLOAT, new_cases_per_million) AS new_cases_per_million,
    TRY_CONVERT(FLOAT, new_cases_smoothed_per_million) AS new_cases_smoothed_per_million,
    TRY_CONVERT(FLOAT, total_deaths_per_million) AS total_deaths_per_million,
    TRY_CONVERT(FLOAT, new_deaths_per_million) AS new_deaths_per_million,
    TRY_CONVERT(FLOAT, new_deaths_smoothed_per_million) AS new_deaths_smoothed_per_million,
    TRY_CONVERT(FLOAT, reproduction_rate) AS reproduction_rate,
    TRY_CONVERT(FLOAT, icu_patients) AS icu_patients,
    TRY_CONVERT(FLOAT, icu_patients_per_million) AS icu_patients_per_million,
    TRY_CONVERT(FLOAT, hosp_patients) AS hosp_patients,
    TRY_CONVERT(FLOAT, hosp_patients_per_million) AS hosp_patients_per_million,
    TRY_CONVERT(FLOAT, weekly_icu_admissions) AS weekly_icu_admissions,
    TRY_CONVERT(FLOAT, weekly_icu_admissions_per_million) AS weekly_icu_admissions_per_million,
    TRY_CONVERT(FLOAT, weekly_hosp_admissions) AS weekly_hosp_admissions,
    TRY_CONVERT(FLOAT, weekly_hosp_admissions_per_million) AS weekly_hosp_admissions_per_million

INTO CovidDeaths_Clean
FROM CovidDeaths;


SELECT COUNT(*) FROM CovidDeaths_Clean;

SELECT * FROM CovidDeaths_Clean;


DROP TABLE IF EXISTS CovidVaccinations;

CREATE TABLE CovidVaccinations (
    iso_code NVARCHAR(50),
    continent NVARCHAR(50),
    location NVARCHAR(255),
    date NVARCHAR(50),
    new_tests NVARCHAR(50),
    total_tests NVARCHAR(50),
    total_tests_per_thousand NVARCHAR(50),
    new_tests_per_thousand NVARCHAR(50),
    new_tests_smoothed NVARCHAR(50),
    new_tests_smoothed_per_thousand NVARCHAR(50),
    positive_rate NVARCHAR(50),
    tests_per_case NVARCHAR(50),
    tests_units NVARCHAR(100),
    total_vaccinations NVARCHAR(50),
    people_vaccinated NVARCHAR(50),
    people_fully_vaccinated NVARCHAR(50),
    new_vaccinations NVARCHAR(50),
    new_vaccinations_smoothed NVARCHAR(50),
    total_vaccinations_per_hundred NVARCHAR(50),
    people_vaccinated_per_hundred NVARCHAR(50),
    people_fully_vaccinated_per_hundred NVARCHAR(50),
    new_vaccinations_smoothed_per_million NVARCHAR(50),
    stringency_index NVARCHAR(50),
    population_density NVARCHAR(50),
    median_age NVARCHAR(50),
    aged_65_older NVARCHAR(50),
    aged_70_older NVARCHAR(50),
    gdp_per_capita NVARCHAR(50),
    extreme_poverty NVARCHAR(50),
    cardiovasc_death_rate NVARCHAR(50),
    diabetes_prevalence NVARCHAR(50),
    female_smokers NVARCHAR(50),
    male_smokers NVARCHAR(50),
    handwashing_facilities NVARCHAR(50),
    hospital_beds_per_thousand NVARCHAR(50),
    life_expectancy NVARCHAR(50),
    human_development_index NVARCHAR(50)
);


BULK INSERT CovidVaccinations
FROM 'C:\Temp\vaccinations.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK,
    CODEPAGE = '65001'
);

SELECT COUNT(*) FROM CovidVaccinations;


SELECT * FROM CovidVaccinations;


DROP TABLE IF EXISTS CovidVaccinations_Clean;

SELECT
    iso_code,
    continent,
    location,

    TRY_CONVERT(DATE, date, 103) AS date,

    TRY_CONVERT(FLOAT, new_tests) AS new_tests,
    TRY_CONVERT(FLOAT, total_tests) AS total_tests,
    TRY_CONVERT(FLOAT, total_tests_per_thousand) AS total_tests_per_thousand,
    TRY_CONVERT(FLOAT, new_tests_per_thousand) AS new_tests_per_thousand,
    TRY_CONVERT(FLOAT, new_tests_smoothed) AS new_tests_smoothed,
    TRY_CONVERT(FLOAT, new_tests_smoothed_per_thousand) AS new_tests_smoothed_per_thousand,
    TRY_CONVERT(FLOAT, positive_rate) AS positive_rate,
    TRY_CONVERT(FLOAT, tests_per_case) AS tests_per_case,
    tests_units,
    TRY_CONVERT(FLOAT, total_vaccinations) AS total_vaccinations,
    TRY_CONVERT(FLOAT, people_vaccinated) AS people_vaccinated,
    TRY_CONVERT(FLOAT, people_fully_vaccinated) AS people_fully_vaccinated,
    TRY_CONVERT(FLOAT, new_vaccinations) AS new_vaccinations,
    TRY_CONVERT(FLOAT, new_vaccinations_smoothed) AS new_vaccinations_smoothed,
    TRY_CONVERT(FLOAT, total_vaccinations_per_hundred) AS total_vaccinations_per_hundred,
    TRY_CONVERT(FLOAT, people_vaccinated_per_hundred) AS people_vaccinated_per_hundred,
    TRY_CONVERT(FLOAT, people_fully_vaccinated_per_hundred) AS people_fully_vaccinated_per_hundred,
    TRY_CONVERT(FLOAT, new_vaccinations_smoothed_per_million) AS new_vaccinations_smoothed_per_million,
    TRY_CONVERT(FLOAT, stringency_index) AS stringency_index,
    TRY_CONVERT(FLOAT, population_density) AS population_density,
    TRY_CONVERT(FLOAT, median_age) AS median_age,
    TRY_CONVERT(FLOAT, aged_65_older) AS aged_65_older,
    TRY_CONVERT(FLOAT, aged_70_older) AS aged_70_older,
    TRY_CONVERT(FLOAT, gdp_per_capita) AS gdp_per_capita,
    TRY_CONVERT(FLOAT, extreme_poverty) AS extreme_poverty,
    TRY_CONVERT(FLOAT, cardiovasc_death_rate) AS cardiovasc_death_rate,
    TRY_CONVERT(FLOAT, diabetes_prevalence) AS diabetes_prevalence,
    TRY_CONVERT(FLOAT, female_smokers) AS female_smokers,
    TRY_CONVERT(FLOAT, male_smokers) AS male_smokers,
    TRY_CONVERT(FLOAT, handwashing_facilities) AS handwashing_facilities,
    TRY_CONVERT(FLOAT, hospital_beds_per_thousand) AS hospital_beds_per_thousand,
    TRY_CONVERT(FLOAT, life_expectancy) AS life_expectancy,
    TRY_CONVERT(FLOAT, human_development_index) AS human_development_index

INTO CovidVaccinations_Clean
FROM CovidVaccinations;


SELECT COUNT(*) FROM CovidVaccinations_Clean;


SELECT * FROM CovidVaccinations_Clean;



---1. Basic Exploration
--- Total Rows


USE PortfolioProjects;

SELECT COUNT(*)
FROM dbo.CovidDeaths_Clean;


SELECT COUNT(*) 
FROM dbo.CovidVaccinations_Clean;


--- Check countries available

SELECT DISTINCT location
FROM PortfolioProjects.dbo.CovidDeaths_Clean
ORDER BY location;


--- 2. Total Cases vs Total Deaths (Global Insight): This shows severity and death ratio

SELECT
    SUM(total_cases) AS total_cases,
    SUM(total_deaths) AS total_deaths,
    SUM(total_deaths) * 100.0 / SUM(total_cases) AS death_percentage
FROM CovidDeaths_Clean;


--- 3. Highest Infection Countries. Which countries had the most cases?

SELECT
    location,
    MAX(total_cases) AS highest_cases
FROM CovidDeaths_Clean
GROUP BY location
ORDER BY highest_cases DESC;


--- 4. Highest Death Count by Country

SELECT
    location,
    MAX(total_deaths) AS total_deaths
FROM CovidDeaths_Clean
GROUP BY location
ORDER BY total_deaths DESC;


--- 5. Death Rate by Country (Important Insight). This is a very strong portfolio query

SELECT
    location,
    MAX(total_deaths) * 100.0 / MAX(total_cases) AS death_rate
FROM CovidDeaths_Clean
WHERE total_cases IS NOT NULL
GROUP BY location
ORDER BY death_rate DESC;


--- 6. Cases as % of Population. Shows how widespread COVID was

SELECT
    location,
    MAX(total_cases) * 100.0 / MAX(population) AS infection_rate
FROM CovidDeaths_Clean
GROUP BY location
ORDER BY infection_rate DESC;


--- 7. UK Analysis (Local Insight 🇬🇧). Tailored to your location (very good for interviews)

SELECT
    date,
    total_cases,
    total_deaths
FROM CovidDeaths_Clean
WHERE location = 'United Kingdom'
ORDER BY date;


--- 8. Join Deaths + Vaccinations (KEY PORTFOLIO STEP). This is where your project becomes advanced

SELECT
    d.location,
    d.date,
    d.total_cases,
    v.total_vaccinations
FROM CovidDeaths_Clean d
JOIN CovidVaccinations_Clean v
    ON d.location = v.location
    AND d.date = v.date
ORDER BY d.location, d.date;


--- 9. Vaccination Progress by Country

SELECT
    location,
    MAX(total_vaccinations) AS total_vaccinations
FROM CovidVaccinations_Clean
GROUP BY location
ORDER BY total_vaccinations DESC;


--- 10. Vaccination Rate vs Population

SELECT
    v.location,
    MAX(v.total_vaccinations) * 100.0 / MAX(d.population) AS vaccination_rate
FROM CovidVaccinations_Clean v
JOIN CovidDeaths_Clean d
    ON v.location = d.location
GROUP BY v.location
ORDER BY vaccination_rate DESC;


--- 11. Rolling Vaccination Count (Advanced). Shows daily progress

SELECT
    location,
    date,
    new_vaccinations,
    SUM(new_vaccinations) OVER (
        PARTITION BY location 
        ORDER BY date
    ) AS rolling_vaccinations
FROM CovidVaccinations_Clean;


--- 12. Compare Cases vs Vaccinations Over Time


SELECT
    d.location,
    d.date,
    d.new_cases,
    v.new_vaccinations
FROM CovidDeaths_Clean d
JOIN CovidVaccinations_Clean v
    ON d.location = v.location
    AND d.date = v.date
WHERE d.location = 'United Kingdom'
ORDER BY d.date;





