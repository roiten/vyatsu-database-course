-- view с информацией о тренере и его любимой машине
CREATE OR REPLACE VIEW v_trainer_info AS
SELECT
    t.id,
    t.last_name,
    t.first_name,
    t.middle_name,
    t.birth_year,
    (EXTRACT(YEAR FROM CURRENT_DATE) - t.birth_year) AS age,
    t.bank_account_number,
    t.photo_url,
    c.title AS favorite_car,
    c.horsepower AS favorite_car_hp,
    c.production_year AS favorite_car_year,
    c.color AS favorite_car_color
FROM trainer t
    LEFT JOIN car c ON t.favorite_car_id = c.id;


-- view с результатами соревнований и призами
CREATE OR REPLACE VIEW v_competition_results AS
SELECT
    c.id AS competition_id,
    c.name AS competition_name,
    c.event_date,
    t.first_name,
    t.last_name,
    a.prize
FROM competition c
    INNER JOIN achievement a ON a.competition_id = c.id
    INNER JOIN trainer t ON t.id = a.trainer_id
ORDER BY c.event_date DESC, a.prize;


-- view с информацией об авто и тренераъ, которые её используют
CREATE OR REPLACE VIEW v_car_full AS
SELECT
    c.id,
    c.title,
    c.description,
    c.horsepower,
    c.production_year,
    c.color,
    c.suspension_name,
    c.is_utilized,
    COUNT(DISTINCT tc.trainer_id) AS trainers_using,
    STRING_AGG(DISTINCT t.last_name, ', ') AS favorite_for
FROM car c
LEFT JOIN trainer_car tc ON tc.car_id = c.id
LEFT JOIN trainer t ON t.favorite_car_id = c.id
GROUP BY
    c.id, c.title, c.description, c.horsepower,
    c.production_year, c.color, c.suspension_name;


-- view со статистикой участий в соревнованиях по тренерам
CREATE OR REPLACE VIEW v_trainer_rating AS
SELECT
    t.id,
    t.first_name,
    t.last_name,
    COUNT(a.id) AS total_achievements,
    COUNT(a.id) FILTER (WHERE a.prize = '1 место') AS wins
FROM trainer t
    LEFT JOIN achievement a ON a.trainer_id = t.id
GROUP BY t.id, t.first_name, t.last_name
ORDER BY wins DESC, total_achievements DESC;


-- view с информацией о соревнованиях и участии тренеров из автоклуба в них
CREATE OR REPLACE VIEW v_competition_full AS
SELECT
    c.id,
    c.name,
    c.event_date,
    COUNT(a.id) AS participants_count,
    STRING_AGG(DISTINCT t.last_name, ', ') AS participants
FROM competition c
    LEFT JOIN achievement a ON a.competition_id = c.id
    LEFT JOIN trainer t ON t.id = a.trainer_id
GROUP BY c.id, c.name, c.event_date;
