SELECT *
FROM dbo.lung_cancer

-- Change AGE Datatype from FLOAT to INT
ALTER TABLE lung_cancer
ALTER COLUMN AGE INT

--Change Cigarettes_per_Day Datatype from FLOAT to INT
ALTER TABLE lung_cancer
 ALTER COLUMN Cigarettes_per_Day INT

 --Change Survival_Years  Datatype from FLOAT to INT
ALTER TABLE lung_cancer
 ALTER COLUMN Survival_Years INT

--Question To Solve (Use SQL/PostgreSQL/Oracle to solve the following Question)

-- Basic Level
-- 1. Retrieve all records for individuals diagnosed with lung cancer.
SELECT *
FROM dbo.lung_cancer

-- 2. Count the number of smokers and non-smokers.


SELECT Smoker, COUNT (smoker) as smokers_count
FROM lung_cancer
 GROUP BY Smoker
ORDER BY Smoker

-- 3. List all unique cancer stages present in the dataset.

SELECT DISTINCT(Cancer_stage)
FROM lung_cancer
ORDER BY Cancer_stage Desc

-- 4. Retrieve the average number of cigarettes smoked per day by smokers.

 SELECT AVG(Cigarettes_per_Day) as AvgSmokerCigarettes
 FROM lung_cancer
 WHERE Smoker = 'Yes'

-- 5. Count the number of people exposed to high air pollution.

 SELECT COUNT (Air_Pollution_Exposure) High_Exposure
FROM dbo.lung_cancer
WHERE Air_Pollution_Exposure = 'High'


-- 6. Find the top 5 countries with the highest lung cancer deaths.

SELECT TOP 5 Country
FROM lung_cancer
GROUP BY Country,Annual_Lung_Cancer_Deaths
ORDER BY Annual_Lung_Cancer_Deaths DESC

-- 7. Count the number of people diagnosed with lung cancer by gender.


SELECT Gender, COUNT (Gender) as Gender_Count
FROM lung_cancer
WHERE lung_Cancer_Diagnosis = 'Yes' 
GROUP BY Gender
ORDER BY Gender

-- 8. Retrieve records of individuals older than 60 who are diagnosed with lung cancer.

SELECT *
FROM lung_cancer
WHERE Age > 60 AND Lung_Cancer_Diagnosis = 'Yes'
ORDER BY AGE ASC



-- Intermediate Level




-- 1. Calculate the average survival years based on cancer stages.  

SELECT Cancer_Stage, AVG(Survival_Years)  AS Avg_Survival_Age
FROM lung_cancer
GROUP BY Cancer_Stage
ORDER BY Avg_Survival_Age DESC

-- 2. Count the number of lung cancer patients based on passive smoking.
SELECT Passive_Smoker, COUNT (Passive_Smoker) Passive_Smokers_Count
FROM lung_cancer
WHERE Lung_Cancer_Diagnosis = 'Yes'
GROUP BY Passive_Smoker


-- 3. Find the country with the highest lung cancer prevalence rate. 

SELECT TOP 1 Country, MAX(Lung_Cancer_Prevalence_Rate) AS MAX
FROM lung_cancer
GROUP BY Country 
ORDER BY MAX Desc



-- 4. Determine the mortality rate for patients with and without early detection. 


SELECT  Early_Detection, AVG(Mortality_Rate) AS Av
FROM dbo.lung_cancer
GROUP BY Early_Detection
ORDER BY Av DESC

-- 5. Group the lung cancer prevalence rate by developed vs. developing countries. 

SELECT Developed_or_Developing, AVG(Lung_Cancer_Prevalence_Rate) as Prevalence_Rate
FROM dbo.lung_cancer
GROUP BY Developed_or_Developing

-- Advanced Level


-- 1. Identify the correlation between lung cancer prevalence and air pollution levels.

SELECT Air_Pollution_Exposure,  AVG(Lung_Cancer_Prevalence_Rate) AS Avg_Prevalence_Rate
FROM dbo.lung_cancer
GROUP BY Air_Pollution_Exposure

-- 2. Find the average age of lung cancer patients for each country. 

SELECT Country, AVG(Age) AS Avg_Age
FROM lung_cancer
WHERE Lung_Cancer_Diagnosis = 'Yes'
GROUP BY Country




-- 3. Rank countries based on their mortality rate. 

SELECT Country, Mortality_Rate,
DENSE_RANK () OVER (ORDER BY Mortality_Rate DESC) AS Rank --Any 2 or more country that has same Mortality rate in digits will belong to same rank 
FROM lung_cancer
ORDER BY Mortality_Rate Desc

--4. Compare lung cancer prevalence in men vs. women across countries.

SELECT  Country, Gender, AVG (Lung_Cancer_Prevalence_Rate) AS APR
from lung_cancer
GROUP BY Country, Gender
ORDER BY APR DESC
-- 

-- 5. Analyze the impact of early detection on survival years.


select  Early_Detection,AVG(Survival_Years) AS AVG_Survival_Year
from lung_cancer
where Lung_Cancer_Diagnosis = 'Yes'
GROUP BY Early_Detection