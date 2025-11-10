--Question 1
--Write a query to return the number of enterprises per sector that completed at least one programme in 2024.

SELECT 
    e.sector,
    COUNT(DISTINCT e.enterprise_id) as enterprise_count
FROM enterprises e
INNER JOIN programme_participation pp 
    ON e.enterprise_id = pp.enterprise_id
WHERE pp.completion_status = 'completed'
    AND YEAR(pp.start_date) = 2024
GROUP BY e.sector
ORDER BY enterprise_count DESC;