-- Добавление автомобиля с возвратом созданной записи
INSERT INTO car (
    title,
    description,
    horsepower,
    production_year,
    color,
    suspension_name
)
VALUES (
    'Volkswagen Beetle',
    'Самый стильный автомобиль в клубе',
    111,
    1975,
    'Красный',
    'MacPherson'
)
RETURNING *;


-- Изменение мощности авто
UPDATE car
SET horsepower = horsepower + 20
WHERE id = 3
RETURNING id, title, horsepower;


-- Удаление специализации тренера
DELETE FROM trainer_car
WHERE trainer_id IN (SELECT id FROM trainer WHERE last_name = 'Торрето')
    AND car_id IN (SELECT id FROM car WHERE title = 'Nissan Skyline GT-R')
RETURNING *;