-- переименовать соревнование
UPDATE competition
SET name = 'Автомобильное ралли Монте-Карло'
WHERE name = 'Ралли Монте-Карло' AND event_date = '2021-01-24';

-- поменять дату соревнования
UPDATE competition
SET event_date = '2018-05-10'
WHERE name = 'Ралли Уэльс' AND event_date = '2018-10-05';

-- поменять приз
UPDATE achievement a
SET prize = '2 место'
FROM trainer t
WHERE a.trainer_id = t.id
    AND t.first_name = 'Мария'
    AND t.last_name = 'Иванова';

-- сменить БИК и любимый авто у тренера
UPDATE trainer
SET bank_account_number = '40702810900000003434'
WHERE first_name = 'Алексей'
    AND last_name = 'Смирнов'
    AND bank_account_number = '40702810900000001238'
    AND birth_year = 1992;

-- изменить url фото автомобиля
UPDATE car
SET photo_url = 'https://tuning-mits.fun/mitsubishi_lancer_evo.jpg'
WHERE photo_url = 'https://cars.pics/mitsubishi_lancer_evo.jpg';

-- перекрасить авто
UPDATE car
SET color = 'Оранжевый'
WHERE color = 'Белый'
    AND title = 'Audi Quattro'
    AND production_year = 1984;

-- утилизировать оку
UPDATE car
SET is_utilized = TRUE
WHERE title = 'ОКА';

-- изменить авто в таблице специализации
UPDATE trainer_car
SET car_id = (SELECT id FROM car WHERE title = 'Porsche 911')
WHERE car_id = (SELECT id FROM car WHERE title = 'ОКА')
    AND trainer_id = (SELECT id FROM trainer WHERE last_name = 'Соколова' AND first_name = 'Анна');


