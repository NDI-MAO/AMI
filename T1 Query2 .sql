WITH revenue_growth AS (
    SELECT 
        f1.enterprise_id,
        f1.year as current_year,
        f1.revenue as current_revenue,
        f2.revenue as previous_revenue,
        ROUND(((f1.revenue - f2.revenue) * 100.0 / f2.revenue), 2) as yoy_growth_pct
    FROM financials f1
    INNER JOIN financials f2 
        ON f1.enterprise_id = f2.enterprise_id
        AND f1.year = f2.year + 1
    WHERE f2.revenue > 0  -- Avoid division by zero
)
SELECT 
    rg.enterprise_id,
    e.country,
    e.sector,
    rg.current_year,
    rg.current_revenue,
    rg.previous_revenue,
    rg.yoy_growth_pct
FROM revenue_growth rg
INNER JOIN enterprises e ON rg.enterprise_id = e.enterprise_id
ORDER BY rg.yoy_growth_pct DESC
LIMIT 10;