-- Функция save_car: вставка или обновление строки таблицы car

CREATE OR REPLACE FUNCTION save_car(
    id_ BIGINT,
    title_ VARCHAR(100),
    photo_url_ VARCHAR(255),
    description_ TEXT,
    horsepower_ INT,
    production_year_ INT,
    color_ VARCHAR(20),
    suspension_name_ VARCHAR(100),
    is_utilized_ BOOLEAN DEFAULT FALSE
)
RETURNS BIGINT
AS $$
DECLARE
    used_id BIGINT;
BEGIN
    IF id_ IS NULL THEN
        INSERT INTO car (title, photo_url, description, horsepower,
                         production_year, color, suspension_name, is_utilized)
        VALUES (title_, photo_url_, description_, horsepower_,
                production_year_, color_, suspension_name_, is_utilized_)
        RETURNING id INTO used_id;
    ELSE
        UPDATE car SET
            title = title_,
            photo_url = photo_url_,
            description = description_,
            horsepower = horsepower_,
            production_year = production_year_,
            color = color_,
            suspension_name = suspension_name_,
            is_utilized = is_utilized_
        WHERE id = id_
        RETURNING id INTO used_id; -- останется NULL, если строки с таким id нет
    END IF;

    RETURN used_id;
END;
$$ LANGUAGE plpgsql;

-- Проверка: вставка новой строки
SELECT save_car(NULL, 'Subaru Impreza WRX STI', NULL,
                'Оппозитный турбомотор и симметричный полный привод.',
                300, 2006, 'Синий', 'MacPherson');

-- Проверка: изменение существующей строки
SELECT save_car(9, 'Peugeot 406', 'https://cars.pics/peugeot_406.jpg',
                'Такси из Марселя. 3.0 V6 после доработки, подвеска от 605-й.',
                220, 1997, 'Белый', 'Independent multi-link');

-- Проверка: изменение несуществующей строки
SELECT save_car(999, 'Lada Granta', NULL, NULL, 98, 2015, 'Серый', 'MacPherson');

SELECT id, title, description, horsepower, production_year, color
FROM car
WHERE id IN (9, 16);
