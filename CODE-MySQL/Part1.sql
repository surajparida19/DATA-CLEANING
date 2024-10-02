-- DATA CLEANING


SELECT *
from layoffs;

-- 1.REMOVE DUPLICATES
-- 2.STANDARDIZED
-- 3.NULL VALUES OR BLANK VALUES
-- 4.REMOVE ANY COLUMNS


CREATE TABLE Layoffs_staging
LIKE layoffs;

SELECT *
from layoffs_staging;

INSERT layoffs_staging
SELECT *
from layoffs;

with duplicate_CTE AS
(
SELECT *,
ROW_NUMBER() OVER(
Partition By company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging
)
SELECT *
from duplicate_CTE
where row_num > 1;


SELECT *
from layoffs_staging
where company='Casper';

with duplicate_CTE AS
(
SELECT *,
ROW_NUMBER() OVER(
Partition By company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging
)
DELETE
from duplicate_CTE
where row_num > 2;


Drop table layoffs_staging2;

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  row_num INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

Select *
from layoffs_staging2
WHERE row_num>1;

INSERT INTO layoffs_staging2
Select *,
ROW_NUMBER() OVER(
Partition By company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) as row_num
from layoffs_staging;


DELETE 
from layoffs_staging2
WHERE row_num>1;

SELECT * 
from layoffs_staging2
WHERE row_num>1;

