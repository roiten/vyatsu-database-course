-- Составной тип t_car_brief и фильтрация массива его объектов

CREATE TYPE t_car_brief AS (
    id BIGINT,
    title VARCHAR(100),
    horsepower INT,
    production_year INT
);

CREATE OR REPLACE FUNCTION filter_car_brief_array(
    arr_ t_car_brief[],
    min_horsepower_ INT
)
RETURNS t_car_brief[]
AS $$
DECLARE
    item t_car_brief;
    result t_car_brief[] := '{}';
BEGIN
    FOREACH item IN ARRAY arr_ LOOP
        IF item.horsepower >= min_horsepower_ THEN
            result := array_append(result, item);
        END IF;
    END LOOP;

    RETURN result;
END;
$$ LANGUAGE plpgsql;

-- Массив формируется из автомобилей японского производства
SELECT filter_car_brief_array(
    ARRAY(
        SELECT (id, title, horsepower, production_year)::t_car_brief
        FROM car
        WHERE title ~ '^(Toyota|Nissan|Mazda|Mitsubishi|Subaru)'
        ORDER BY id
    ),
    250
);

-- Развёртывание результата в таблицу для наглядности
SELECT *
FROM unnest(filter_car_brief_array(
    ARRAY(
        SELECT (id, title, horsepower, production_year)::t_car_brief
        FROM car
        WHERE title ~ '^(Toyota|Nissan|Mazda|Mitsubishi|Subaru)'
        ORDER BY id
    ),
    250
));
