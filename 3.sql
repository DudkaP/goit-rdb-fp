USE pandemic;

SELECT 
    e.entity,
    e.code,
    AVG(CAST(ic.Number_rabies AS DECIMAL(15, 4))) AS avg_rabies,
    MIN(CAST(ic.Number_rabies AS DECIMAL(15, 4))) AS min_rabies,
    MAX(CAST(ic.Number_rabies AS DECIMAL(15, 4))) AS max_rabies,
    SUM(CAST(ic.Number_rabies AS DECIMAL(15, 4))) AS sum_rabies
FROM infectious_cases_normalized ic
JOIN entities e ON ic.entity_id = e.id
WHERE ic.Number_rabies IS NOT NULL 
  AND ic.Number_rabies != ''
GROUP BY e.id, e.entity, e.code
ORDER BY avg_rabies DESC
LIMIT 10;
