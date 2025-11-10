--Task 2 Question 1
--Enterprises with revenue < 100 but employees > 50

ALTER TABLE financials ADD COLUMN data_quality_flag VARCHAR(100);

UPDATE financials
SET data_quality_flag = 'revenue_employee_mismatch'
WHERE revenue < 100 AND employees > 50;