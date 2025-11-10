ALTER TABLE financials ADD COLUMN data_quality_flag VARCHAR(100);

UPDATE financials
SET data_quality_flag = 'revenue_employee_mismatch'
WHERE revenue < 100 AND employees > 50;