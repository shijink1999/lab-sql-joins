use sakila;
select c.name as category,count(fc.film_id) as film_count from category c
left join film_category fc on
c.category_id = fc.category_id
group by c.name
ORDER BY film_count desc;
SELECT 
    s.store_id, 
    ci.city, 
    co.country
FROM 
    store s
JOIN 
    address a ON s.address_id = a.address_id
JOIN 
    city ci ON a.city_id = ci.city_id
JOIN 
    country co ON ci.country_id = co.country_id;
SELECT 
    s.store_id, 
    CONCAT('$', FORMAT(SUM(p.amount), 2)) AS total_revenue
FROM 
    store s
JOIN 
    staff st ON s.store_id = st.store_id
JOIN 
    payment p ON st.staff_id = p.staff_id
GROUP BY 
    s.store_id;
SELECT 
    c.name AS category, 
    ROUND(AVG(f.length), 2) AS avg_runtime_minutes
FROM 
    category c
JOIN 
    film_category fc ON c.category_id = fc.category_id
JOIN 
    film f ON fc.film_id = f.film_id
GROUP BY 
    c.name
ORDER BY 
    avg_runtime_minutes DESC;
SELECT 
    c.name AS category, 
    ROUND(AVG(f.length), 2) AS avg_runtime_minutes
FROM 
    category c
JOIN 
    film_category fc ON c.category_id = fc.category_id
JOIN 
    film f ON fc.film_id = f.film_id
GROUP BY 
    c.name
ORDER BY 
    avg_runtime_minutes DESC
LIMIT 5;
SELECT 
    f.title, 
    COUNT(r.rental_id) AS rental_count
FROM 
    film f
JOIN 
    inventory i ON f.film_id = i.film_id
JOIN 
    rental r ON i.inventory_id = r.inventory_id
GROUP BY 
    f.title
ORDER BY 
    rental_count DESC
LIMIT 10;
SELECT 
    f.title,
    s.store_id,
    CASE 
        WHEN COUNT(i.inventory_id) > 0 THEN 'Available'
        ELSE 'NOT available'
    END AS availability
FROM 
    film f
LEFT JOIN 
    inventory i ON f.film_id = i.film_id AND i.store_id = 1
LEFT JOIN 
    store s ON i.store_id = s.store_id
WHERE 
    f.title = 'Academy Dinosaur'
GROUP BY 
    f.title, s.store_id;
SELECT 
    f.title,
    CASE 
        WHEN COUNT(i.inventory_id) > 0 THEN 'Available'
        ELSE 'NOT available'
    END AS availability_status,
    COUNT(i.inventory_id) AS inventory_count
FROM 
    film f
LEFT JOIN 
    inventory i ON f.film_id = i.film_id
GROUP BY 
    f.title
ORDER BY 
    availability_status, f.title;