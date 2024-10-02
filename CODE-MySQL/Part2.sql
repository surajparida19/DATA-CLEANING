
DELETE 
from layoffs_staging2
WHERE row_num>1;



SELECT * 
from layoffs_staging2
WHERE row_num>1;

-- STANDARDIZING DATA

select company, TRIM(company)
from layoffs_staging2;

UPDATE  layoffs_staging2
set company=TRIM(company);

select Distinct industry
from layoffs_staging2
;

update layoffs_staging2
set industry='crypto'
where industry like 'crypto%';


SELECT distinct country, TRIM(country)
from layoffs_staging2
WHERE country like 'united states%'
order by 1;

update layoffs_staging2
set country=trim(trailing'.' from country)
where country like 'United States%';

select *
from layoffs_staging2;

select `date`
from layoffs_staging2;




update layoffs_staging2
set date = str_to_date(`date`,'%m/%d/%Y');


Alter table layoffs_staging2
Modify column `date` DATE;

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

Update layoffs_staging2
set industry = NULL
where industry='';

SELECT *
from layoffs_staging2
where industry is null
or industry='';

SELECT *
from layoffs_staging2
where company like 'Bally%';

SELECT *
from layoffs_staging2 as t1
join layoffs_staging2 as t2
	ON t1.company=t2.company
WHERE(t1.industry IS NULL OR t1.industry='')
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 as t1
join layoffs_staging2 as t2
	ON t1.company=t2.company
set	t1.industry=t2.industry
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL;

Select *
from layoffs_staging2;

Select *
from layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

DELETE 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

Select *
from layoffs_staging2;

ALTER table layoffs_staging2
DROP column row_num;


Select *
from layoffs_staging2;


