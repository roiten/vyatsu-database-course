-- Автомобили мощнее средней мощности автопарка
SELECT *
FROM car
WHERE horsepower > (SELECT AVG(horsepower) FROM car);


-- Тренеры без достижений в соревнованиях
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


-- Количество достижений у каждого тренера
WITH trainer_results AS (
    SELECT
        trainer_id,
        COUNT(*) AS achievement_count
    FROM achievement
    GROUP BY trainer_id
)
SELECT
    t.last_name,
    t.first_name,
    tr.achievement_count
FROM trainer_results tr
INNER JOIN trainer t ON t.id = tr.trainer_id
ORDER BY tr.achievement_count DESC;