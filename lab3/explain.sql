-- Обычный план выполнения
EXPLAIN
SELECT *
FROM car
WHERE title = 'Mazda MX-5 Miata';


-- План с фактическим временем выполнения
EXPLAIN (ANALYSE)
SELECT
    t.id,
    t.last_name,
    t.first_name
FROM trainer t
WHERE NOT EXISTS (
    SELECT 1
    FROM achievement a
    WHERE a.trainer_id = t.id
);


-- План с буферами и index only scan
EXPLAIN (ANALYZE, BUFFERS)
SELECT title
FROM car
WHERE title = 'Toyota Supra';


-- План в формате JSON
EXPLAIN (ANALYSE, FORMAT JSON)
SELECT
    t.last_name,
    t.first_name,
    c.title AS car_title
FROM trainer t
JOIN trainer_car tc ON tc.trainer_id = t.id
JOIN car c ON c.id = tc.car_id;


