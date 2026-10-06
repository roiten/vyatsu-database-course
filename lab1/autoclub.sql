-- Задание
-- БД для хранения информации о доступных ресурсах гоночного клуба. Проектируемая система должна выполнять следующие действия:
-- * Редактировать автопарк - набор гоночных автомобилей, гоночный автомобиль можно добавить, редактировать информацию, отправить в утилизацию. Автомобиль в утилизации более не может катать клиентов.
-- * Гоночный автомобиль состоит из заголовка, фото, описания, кол-ва лошадиных сил, года выпуска, цвета, наименования подвески.
-- * Редактировать тренерский состав - добавлять, удалять, редактировать информацию о тренере.
-- * Информация о тренере включает в себя ФИО, года рождения, номер счёта в банке для начисления заработной платы, фото тренера, список достижений тренера, список автомобилей, на которых тренер может тренировать. А также любимый автомобиль тренера.
-- * Список достижений тренера состоит из элементов, каждый из которых включает в себя наименование соревнования, дату проведения соревнования и занятое место.

CREATE DATABASE autoclub;

CREATE TABLE IF NOT EXISTS car (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    photo_url VARCHAR(255),
    description TEXT,
    horsepower INT NOT NULL,
    production_year INT NOT NULL,
    color VARCHAR(20) NOT NULL,
    suspension_name VARCHAR(100) NOT NULL,
    is_utilized BOOLEAN NOT NULL DEFAULT FALSE
);

индекс по заголовку
индекс по лошадиным силам
индекс по году производства
индекс по цвету
индекс по подвеске
индекс по утилю


CREATE TABLE IF NOT EXISTS trainer (
    id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    middle_name VARCHAR(100),
    birth_year INT NOT NULL, -- CHECK > 1900
    bank_account_number VARCHAR(30) NOT NULL,
    photo_url VARCHAR(255),
    favorite_car_id BIGINT REFERENCES car(id)
);

индексы по имени

CREATE TABLE IF NOT EXISTS trainer_car (
    trainer_id BIGINT NOT NULL REFERENCES trainer(id),
    car_id BIGINT NOT NULL REFERENCES car(id),
    PRIMARY KEY (trainer_id, car_id)
);

индекс отдельно по тренеру
отдельно по авто

CREATE TABLE IF NOT EXISTS achievement (
    id BIGSERIAL PRIMARY KEY,
    trainer_id BIGINT NOT NULL REFERENCES trainer(id),
    competition_id BIGINT NOT NULL REFERENCES competition(id),
    prize VARCHAR(20) NOT NULL
);

индекс по тренеру

CREATE TABLE IF NOT EXISTS competition (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    event_date DATE NOT NULL -- CHECK Date > 1900
);

возможно понадобится индекс по дате

DROP DATABASE autoclub;


--
-- erDiagram
--     CAR {
--         BIGSERIAL id PK
--         VARCHAR(100) title
--         VARCHAR(255) photo_url
--         TEXT description
--         INT horsepower
--         INT production_year
--         VARCHAR(20) color
--         VARCHAR(100) suspension_name
--         BOOLEAN is_utilized
--     }
--
--     TRAINER_CAR {
--         BIGINT trainer_id PK
--         BIGINT car_id PK
--     }
--
--     TRAINER {
--         BIGSERIAL id PK
--         VARCHAR(100) first_name
--         VARCHAR(100) last_name
--         VARCHAR(100) middle_name
--         INT birth_year
--         VARCHAR(30) bank_account_number
--         VARCHAR(255) photo_url
--         BIGINT favorite_car_id FK
--     }
--
--     COMPETITION {
--         BIGSERIAL id PK
--         VARCHAR(150) name
--         DATE event_date
--     }
--
--     ACHIEVEMENT {
--         BIGSERIAL id PK
--         BIGINT trainer_id FK
--         BIGINT competition_id FK
--         VARCHAR(20) prize
--     }
--
--     CAR ||--o{ TRAINER_CAR : "иметь запись"
--     TRAINER ||--o{ TRAINER_CAR : "иметь запись"
--     TRAINER ||--o| CAR : "предпочитать"
--     ACHIEVEMENT o{--|| COMPETITION : "проводиться"
--     TRAINER ||--o{ ACHIEVEMENT : "иметь достижение"
--
