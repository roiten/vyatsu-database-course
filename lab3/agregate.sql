-- Количество автомобилей в автопарке
SELECT COUNT(*) AS total_cars
FROM car;

-- Статистика мощности авто
SELECT
    AVG(horsepower) AS average_horsepower,
    MIN(horsepower) AS min_horsepower,
    MAX(horsepower) AS max_horsepower,
    SUM(horsepower) AS total_horsepower
FROM car
WHERE is_utilized = FALSE;

-- Количество авто каждого цвета
SELECT
    color,
    COUNT(*) AS car_count,
    AVG(horsepower) AS average_horsepower
FROM car
WHERE is_utilized = FALSE
GROUP BY color
ORDER BY car_count DESC;

-- Автомобили по тренерам
SELECT
    t.id,
    t.last_name,
    t.first_name,
    COUNT(tc.car_id) AS car_count,
    STRING_AGG(c.title, ', ') AS cars
FROM trainer t
LEFT JOIN trainer_car tc ON tc.trainer_id = t.id
LEFT JOIN car c ON c.id = tc.car_id
GROUP BY t.id, t.last_name, t.first_name
ORDER BY car_count DESC;

-- Тренеры, которые работают с 3 и более автомобилями
SELECT
    t.id,
    t.last_name,
    t.first_name,
    COUNT(tc.car_id) AS car_count
FROM trainer t
JOIN trainer_car tc ON tc.trainer_id = t.id
JOIN car c ON c.id = tc.car_id
WHERE c.is_utilized = FALSE
GROUP BY t.id, t.last_name, t.first_name
HAVING COUNT(tc.car_id) > 2
ORDER BY car_count DESC;
