SELECT 
    CO.country_name, 
    COUNT(*) AS customer_count, 
    AVG(INV.total_price) AS average_total_price
FROM 
    country CO
INNER JOIN 
    city CI ON CO.id = CI.country_id
INNER JOIN 
    customer cu ON CI.id = cu.city_id
INNER JOIN 
    invoice INV ON cu.id = INV.customer_id
GROUP BY 
    CO.country_name
HAVING 
    AVG(INV.total_price) > (SELECT AVG(total_price) FROM invoice);