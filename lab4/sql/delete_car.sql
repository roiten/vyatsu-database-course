-- Функция delete_car: удаление автомобиля при отсутствии внешних ссылок

CREATE OR REPLACE FUNCTION delete_car(
    id_ BIGINT
)
RETURNS VOID
AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM trainer WHERE favorite_car_id = id_)
       OR EXISTS (SELECT 1 FROM trainer_car WHERE car_id = id_) THEN
        RAISE EXCEPTION 'Невозможно выполнить удаление, так как есть внешние ссылки'
            USING ERRCODE = 'foreign_key_violation',
                  DETAIL = format('На автомобиль с id = %s ссылаются таблицы trainer или trainer_car', id_);
    END IF;

    DELETE FROM car WHERE id = id_;
END;
$$ LANGUAGE plpgsql;

-- Автомобиль 15 (дубликат Volkswagen Beetle) не закреплён ни за одним тренером
SELECT delete_car(15);

-- На автомобиль 4 (Toyota Supra) ссылается trainer_car
SELECT delete_car(4);

SELECT id, title FROM car WHERE id IN (4, 15);
