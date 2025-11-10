SELECT 
    e.country,
    pp.completion_status,
    COUNT(DISTINCT e.enterprise_id) as enterprise_count,
    ROUND(AVG(f.employees), 2) as avg_employees,
    ROUND(AVG(f.revenue), 2) as avg_revenue
FROM enterprises e
INNER JOIN programme_participation pp 
    ON e.enterprise_id = pp.enterprise_id
INNER JOIN financials f 
    ON e.enterprise_id = f.enterprise_id
WHERE f.employees IS NOT NULL 
    AND f.revenue IS NOT NULL
    AND pp.completion_status IS NOT NULL
GROUP BY e.country, pp.completion_status
ORDER BY e.country, pp.completion_status;