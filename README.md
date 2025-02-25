##  <h1 align="center"> LUNG-CANCER-ANALYSIS</h1>
-----------

# BASIC SECTION

###  -- 1. Retrieve all records for individuals diagnosed with lung cancer.

```sql
SELECT *
FROM dbo.lung_cancer

```
![Image](https://github.com/user-attachments/assets/aa409c2a-4b56-4cbc-ae9d-ab3a01fb88d2)  


###  2. Count the number of smokers and non-smokers.

```sql
SELECT Smoker, COUNT (smoker) as smokers_count
FROM lung_cancer
 GROUP BY Smoker
ORDER BY Smoker
```

![Image](https://github.com/user-attachments/assets/11d43abd-94fd-4936-bc24-c05182bfed06)  


### 3. List all unique cancer stages present in the dataset.

```sql
SELECT DISTINCT(Cancer_stage)
FROM lung_cancer
ORDER BY Cancer_stage Desc
```
![Image](https://github.com/user-attachments/assets/9497f4b0-dc5e-4267-8607-8e3c8cbc041a)  


### 4. Retrieve the average number of cigarettes smoked per day by smokers.
```sql
 SELECT AVG(Cigarettes_per_Day) as AvgSmokerCigarettes
 FROM lung_cancer
 WHERE Smoker = 'Yes'
```
![Image](https://github.com/user-attachments/assets/ae4f6a2c-fe3d-4ade-b9c0-a8d3bc9cd9c7)



### 5. Count the number of people exposed to high air pollution.

```sql
 SELECT COUNT (Air_Pollution_Exposure) High_Exposure
FROM dbo.lung_cancer
WHERE Air_Pollution_Exposure = 'High'
```
![Image](https://github.com/user-attachments/assets/0e53c735-63c7-4118-a230-b1f93c41b2f5)  

### 6. Find the top 5 countries with the highest lung cancer deaths.
```sql
 SELECT TOP 5 Country
FROM lung_cancer
GROUP BY Country,Annual_Lung_Cancer_Deaths
ORDER BY Annual_Lung_Cancer_Deaths DESC
```
![Image](https://github.com/user-attachments/assets/3f37da7e-a24b-4283-b5b9-de2f86c8f7c6)  


### 7. Count the number of people diagnosed with lung cancer by gender.
```sql
SELECT Gender, COUNT (Gender) as Gender_Count
FROM lung_cancer
GROUP BY Gender
ORDER BY Gender
```
![Image](https://github.com/user-attachments/assets/ce33bd96-ff1c-475e-8d7f-6e1fedaaba9f)


### 8. Retrieve records of individuals older than 60 who are diagnosed with lung cancer.
```sql
SELECT *
FROM lung_cancer
WHERE Age > 60 AND Lung_Cancer_Diagnosis = 'Yes'
ORDER BY AGE ASC
```
![Image](https://github.com/user-attachments/assets/0cab300d-8b4a-446f-af9a-538e8ffba5f8)  

# INTERMEDIATE SECTION  

### 1. Calculate the average survival years based on cancer stages. 
```sql
SELECT Cancer_Stage, AVG(Survival_Years)  AS Avg_Survival_Age
FROM lung_cancer
GROUP BY Cancer_Stage
ORDER BY Avg_Survival_Age DESC
```
![Image](https://github.com/user-attachments/assets/c494a6af-f7a5-46cc-b2b7-649d7cb4bcc1)

### 2. Count the number of lung cancer patients based on passive smoking.
```sql

SELECT Passive_Smoker, COUNT (Passive_Smoker) Passive_Smokers_Count
FROM lung_cancer
WHERE Lung_Cancer_Diagnosis = 'Yes'
GROUP BY Passive_Smoker
```
![Image](https://github.com/user-attachments/assets/ce449c5d-61c7-4fd0-bdb7-2828a5aeb1cc)

### 3. Find the country with the highest lung cancer prevalence rate. 
```sql
SELECT TOP 1 Country, MAX(Lung_Cancer_Prevalence_Rate) AS MAX
FROM lung_cancer
GROUP BY Country 
ORDER BY MAX Desc
```
![Image](https://github.com/user-attachments/assets/c8f25947-7aa4-4aa3-b201-8a0b6eb2cb7a)

### 4. Determine the mortality rate for patients with and without early detection. 

```sql
SELECT  Early_Detection, AVG(Mortality_Rate) AS Av
FROM dbo.lung_cancer
GROUP BY Early_Detection
ORDER BY Av DESC
```
![Image](https://github.com/user-attachments/assets/ecb22e43-a1f7-4ee9-bc60-2cec2541baee)

# ADVANCED SECTION  

