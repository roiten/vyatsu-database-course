-- Поиск автомобилей по необязательным критериям (динамический запрос)

CREATE OR REPLACE FUNCTION search_car(
    title_ VARCHAR DEFAULT NULL,
    color_ VARCHAR DEFAULT NULL,
    min_horsepower_ INT DEFAULT NULL,
    only_active_ BOOLEAN DEFAULT TRUE,
    order_by_ TEXT DEFAULT 'id'
)
RETURNS SETOF car
AS $$
DECLARE
    query TEXT := 'SELECT * FROM car WHERE TRUE';
BEGIN
    IF title_ IS NOT NULL THEN
        query := query || ' AND title ILIKE ''%'' || $1 || ''%''';
    END IF;
    IF color_ IS NOT NULL THEN
        query := query || ' AND color = $2';
    END IF;
    IF min_horsepower_ IS NOT NULL THEN
        query := query || ' AND horsepower >= $3';
    END IF;
    IF only_active_ THEN
        query := query || ' AND NOT is_utilized';
    END IF;

    IF order_by_ NOT IN ('id', 'title', 'horsepower', 'production_year') THEN
        RAISE EXCEPTION 'Недопустимый столбец для сортировки: %', order_by_;
    END IF;
    query := query || format(' ORDER BY %I', order_by_);
    IF order_by_ <> 'id' THEN
        query := query || ', id'; -- однозначный порядок строк с равными значениями
    END IF;

    RAISE NOTICE '%', query;

    RETURN QUERY EXECUTE query USING title_, color_, min_horsepower_;
END;
$$ LANGUAGE plpgsql;

-- Синие автомобили, отсортированные по мощности
SELECT id, title, color, horsepower
FROM search_car(color_ => 'Синий', order_by_ => 'horsepower');

-- Автомобили Audi мощностью от 250 л.с.
SELECT id, title, color, horsepower
FROM search_car(title_ => 'audi', min_horsepower_ => 250);

-- Все автомобили, включая утилизированные, по году выпуска
SELECT id, title, production_year, is_utilized
FROM search_car(only_active_ => FALSE, order_by_ => 'production_year');
