-- Identify duplicates
SELECT enterprise_id, COUNT(DISTINCT country) as country_count
FROM enterprises
GROUP BY enterprise_id
HAVING COUNT(DISTINCT country) > 1;

-- Add validation flag
ALTER TABLE enterprises ADD COLUMN is_duplicate BOOLEAN DEFAULT FALSE;

UPDATE enterprises e1
SET is_duplicate = TRUE
WHERE EXISTS (
    SELECT 1 FROM enterprises e2
    WHERE e1.enterprise_id = e2.enterprise_id
    AND e1.country != e2.country
);