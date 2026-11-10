-- Функция фильтрации автомобилей по мощности

CREATE OR REPLACE FUNCTION filter_car_by_horsepower(
    min_horsepower_ INT
)
RETURNS SETOF car
AS $$
BEGIN
    RETURN QUERY
        SELECT *
        FROM car
        WHERE horsepower >= min_horsepower_
        ORDER BY horsepower DESC;
END;
$$ LANGUAGE plpgsql;

SELECT id, title, horsepower, production_year, color
FROM filter_car_by_horsepower(300);
