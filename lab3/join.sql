-- Nested Loop
SET enable_nestloop = ON;
SET enable_hashjoin = OFF;
SET enable_mergejoin = OFF;

EXPLAIN (ANALYZE, FORMAT JSON)
SELECT
    t.id,
    t.last_name,
    c.title
FROM trainer t
INNER JOIN trainer_car tc ON tc.trainer_id = t.id
INNER JOIN car c ON c.id = tc.car_id;


-- Hash Join
SET enable_nestloop = OFF;
SET enable_hashjoin = ON;
SET enable_mergejoin = OFF;

EXPLAIN (ANALYZE, FORMAT JSON)
SELECT
    t.id,
    t.last_name,
    c.title
FROM trainer t
JOIN trainer_car tc ON tc.trainer_id = t.id
JOIN car c ON c.id = tc.car_id;


-- Merge Join
SET enable_nestloop = OFF;
SET enable_hashjoin = OFF;
SET enable_mergejoin = ON;

EXPLAIN (ANALYZE, FORMAT JSON)
SELECT
    t.id,
    t.last_name,
    c.title
FROM trainer t
JOIN trainer_car tc ON tc.trainer_id = t.id
JOIN car c ON c.id = tc.car_id;



RESET enable_nestloop;
RESET enable_hashjoin;
RESET enable_mergejoin;
