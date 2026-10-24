USE pandemic;

SELECT 
    Year,
    MAKEDATE(Year, 1) AS start_of_year_date,
    CURDATE() AS current_date_val,
    TIMESTAMPDIFF(YEAR, MAKEDATE(Year, 1), CURDATE()) AS year_difference
FROM infectious_cases_normalized;
