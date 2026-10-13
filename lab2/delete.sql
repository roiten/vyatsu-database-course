-- удалить запись в таблице специализации
DELETE FROM trainer_car
WHERE trainer_id = (
    SELECT id FROM trainer
    WHERE first_name = 'Сергей' AND last_name = 'Кузнецов'
)
AND car_id = (
    SELECT id FROM car WHERE title = 'Audi RS2'
);


-- удалить авто из таблицы
DELETE FROM car
WHERE title = 'Tesla Model S'
  AND production_year = 2023;


-- удалить тренера
DELETE FROM trainer
WHERE first_name = 'Сергей' AND last_name = 'Кузнецов';


-- удалить соревнование
DELETE FROM competition
WHERE name = 'Ралли Австралия'
  AND event_date = '2014-09-12';