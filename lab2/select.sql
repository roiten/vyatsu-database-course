-- получим список названий первых 10 авто в алфавитном порядке
SELECT title
FROM car
ORDER BY title
LIMIT 10;


-- найти 3 тренера которые катают на Mazda Miata
SELECT last_name, first_name, middle_name, birth_year
FROM trainer t
    INNER JOIN trainer_car tc ON t.id = tc.trainer_id
    INNER JOIN car c ON tc.car_id = c.id
WHERE c.title = 'Mazda MX-5 Miata'
ORDER BY last_name
LIMIT 3;


-- поиск второго среди пожилых тренера
SELECT last_name, first_name, middle_name, birth_year
FROM trainer
ORDER BY birth_year
LIMIT 1 OFFSET 1;


-- поиск авто, у которых мощность больше 100 лс и они не утилизированы
SELECT *
FROM car
WHERE horsepower > 100
AND is_utilized = FALSE;


-- вывод списка призёров кубка поршня
SELECT
    t.last_name AS trainer,
    c.name AS competition,
    a.prize,
    'Победитель' AS status
FROM achievement a
    INNER JOIN trainer t ON t.id = a.trainer_id
    INNER JOIN competition c ON c.id = a.competition_id
WHERE a.prize = '1 место' AND c.name = 'Кубок Поршня'

UNION

SELECT
    t.last_name AS trainer,
    c.name AS competition,
    a.prize,
    'Призёр' AS status
FROM achievement a
    INNER JOIN trainer t ON t.id = a.trainer_id
    INNER JOIN competition c ON c.id = a.competition_id
WHERE a.prize <> '1 место' AND c.name = 'Кубок Поршня'
ORDER BY trainer, competition;


-- поиск тренеров с фамилией на 'И'
SELECT
    last_name,
    first_name
FROM trainer
WHERE last_name LIKE 'И%'
ORDER BY last_name, first_name;


-- тренеры, которые ездят только на одной машине
SELECT
    t.first_name,
    t.last_name,
    COUNT(tc.car_id) AS cars_count
FROM trainer t
    INNER JOIN trainer_car tc ON tc.trainer_id = t.id
GROUP BY t.id, t.first_name, t.last_name
HAVING COUNT(tc.car_id) = 1
ORDER BY cars_count DESC;


--простой подзапрос, поиск автомобилей с мощностью больше средней по гаражу
SELECT
    horsepower,
    title
FROM car
WHERE horsepower > (
    SELECT AVG(horsepower)
    FROM car
)
ORDER BY horsepower DESC;


-- коррелированный подзапрос, поиск тренеров, у которых любимый авто мощнее 300 л.с.
SELECT
    first_name,
    last_name,
    birth_year
FROM trainer
WHERE favorite_car_id IN (
    SELECT id
    FROM car
    WHERE horsepower > 300
);


-- вывод списка авто + сколько тренеров используют и у кого это любимое авто
SELECT title, is_utilized, favorite_for, trainers_using
FROM v_car_full;

-- вывод информации о тренерах и некоторых характеристиках их любимых авто
SELECT last_name, first_name, favorite_car, favorite_car_hp, favorite_car_color
FROM v_trainer_info;

-- вывод сводки по соревнованиям
SELECT *
FROM v_competition_full;

-- вывод результатов соревнований
SELECT competition_name, event_date, first_name, last_name, prize
FROM v_competition_results;

-- вывод рейтинга тренеров (общее количество достижений, побед)
SELECT first_name, last_name, total_achievements, wins
FROM v_trainer_rating
ORDER BY
    total_achievements DESC,
    wins DESC;
