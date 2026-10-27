-- Поиск автомобилей заданной мощности
SELECT *
FROM car
WHERE horsepower BETWEEN 400 AND 700
  AND is_utilized = FALSE;


-- Поиск авто по названию
SELECT *
FROM car
WHERE title LIKE 'Audi%';


-- Вывод ФИО тренеров
SELECT
    id,
    CONCAT(last_name, ' ', first_name, ' ',
           COALESCE(middle_name, '')) AS full_name
FROM trainer
ORDER BY id;


-- Классификация автомобилей по мощности
SELECT
    title,
    horsepower,
    CASE
        WHEN horsepower < 300 THEN 'Низкая мощность'
        WHEN horsepower BETWEEN 300 AND 600 THEN 'Средняя мощность'
        ELSE 'Высокая мощность'
    END AS power_category
FROM car
WHERE is_utilized = FALSE
ORDER BY horsepower DESC;


-- Возраст тренеров
SELECT
    id,
    last_name,
    first_name,
    birth_year,
    EXTRACT(YEAR FROM CURRENT_DATE)::INT - birth_year AS approximate_age
FROM trainer
ORDER BY birth_year;


-- Соревнования за последние пять лет
SELECT
    id,
    name,
    event_date
FROM competition
WHERE event_date BETWEEN CURRENT_DATE - INTERVAL '5 years' AND CURRENT_DATE
ORDER BY event_date DESC;


-- Сколько дней прошло с соревнования
SELECT
    name,
    event_date,
    CURRENT_DATE - event_date AS days_since_competition
FROM competition
WHERE event_date <= CURRENT_DATE
ORDER BY event_date DESC;

