-- Таблица гоночных автомобилей
CREATE TABLE IF NOT EXISTS car (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    photo_url VARCHAR(255),
    description TEXT,
    horsepower INT NOT NULL CHECK (horsepower > 0),
    production_year INT NOT NULL CHECK (production_year > 1900),
    color VARCHAR(20) NOT NULL,
    suspension_name VARCHAR(100) NOT NULL,
    is_utilized BOOLEAN NOT NULL DEFAULT FALSE
);

-- Индекс для поиска по названию
CREATE INDEX ON car(title);


-- Таблица тренеров
CREATE TABLE IF NOT EXISTS trainer (
    id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    birth_year INT NOT NULL,
    bank_account_number VARCHAR(30) UNIQUE NOT NULL,
    photo_url VARCHAR(255),
    favorite_car_id BIGINT REFERENCES car(id) ON DELETE SET NULL,

    CHECK (birth_year > 1900)
);

-- Индекс для поиска по ФИО
CREATE INDEX ON trainer(last_name, first_name, middle_name);


-- Промежуточная таблица: тренер – автомобили, на которых может тренировать
CREATE TABLE IF NOT EXISTS trainer_car (
    trainer_id BIGINT NOT NULL REFERENCES trainer(id) ON DELETE CASCADE,
    car_id BIGINT NOT NULL REFERENCES car(id) ON DELETE CASCADE,
    PRIMARY KEY (trainer_id, car_id)
);

-- Индекс для поиска по id авто
CREATE INDEX ON trainer_car(car_id);


-- Таблица соревнований
CREATE TABLE IF NOT EXISTS competition (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    event_date DATE NOT NULL,
    CHECK (event_date > DATE '1900-01-01')
);


-- Таблица достижений тренера
CREATE TABLE IF NOT EXISTS achievement (
    id BIGSERIAL PRIMARY KEY,
    trainer_id BIGINT NOT NULL REFERENCES trainer(id) ON DELETE CASCADE,
    competition_id BIGINT NOT NULL REFERENCES competition(id) ON DELETE CASCADE,
    prize VARCHAR(20) NOT NULL
);

-- Индекс для поиска достижений по id тренера
CREATE INDEX ON achievement(trainer_id);