-- Журнал изменений мощности автомобилей

CREATE TABLE IF NOT EXISTS log_car (
    id BIGSERIAL PRIMARY KEY,
    car_id BIGINT NOT NULL REFERENCES car(id) ON DELETE CASCADE,
    change_datetime TIMESTAMP NOT NULL DEFAULT NOW(),
    old_horsepower INT,
    new_horsepower INT NOT NULL
);

CREATE OR REPLACE FUNCTION log_car_horsepower()
RETURNS TRIGGER
AS $$
DECLARE
    old_val INT;
BEGIN
    IF TG_OP = 'UPDATE' THEN
        IF OLD.horsepower = NEW.horsepower THEN
            RETURN NEW; -- мощность не изменилась, запись в журнал не нужна
        END IF;
        old_val := OLD.horsepower;
    ELSE
        old_val := NULL;
    END IF;

    INSERT INTO log_car (car_id, old_horsepower, new_horsepower)
    VALUES (NEW.id, old_val, NEW.horsepower);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER log_car_horsepower_change
AFTER INSERT OR UPDATE OF horsepower
ON car
FOR EACH ROW
EXECUTE FUNCTION log_car_horsepower();

-- Проверка: вставка, два изменения мощности и изменение другого столбца
INSERT INTO car (title, horsepower, production_year, color, suspension_name)
VALUES ('Ford Focus RS', 350, 2016, 'Синий', 'MacPherson');

UPDATE car SET horsepower = 375 WHERE title = 'Ford Focus RS';
UPDATE car SET horsepower = horsepower + 30 WHERE id = 3;
UPDATE car SET color = 'Голубой' WHERE title = 'Ford Focus RS';

SELECT l.id, l.car_id, c.title, l.change_datetime,
       l.old_horsepower, l.new_horsepower
FROM log_car l
JOIN car c ON c.id = l.car_id
ORDER BY l.id;
