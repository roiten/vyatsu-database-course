-- заполняем таблицу автомобилей
INSERT INTO car (title, photo_url, description, horsepower, production_year, color, suspension_name, is_utilized)
VALUES (
    'ВАЗ 2107',
    'https://cars.pics/vaz_2107.jpg',
    'Шаха. "Семёрка". Заднеприводная классика, знакомая каждому.',
    76,
    1995,
    'Белый',
    'Crossmember ',
    FALSE
);

INSERT INTO car (title, photo_url, description, horsepower, production_year, color, suspension_name, is_utilized)
VALUES (
    'ОКА',
    'https://cars.pics/oka.jpg',
    'В простонародии бешенная табуретка. Самодел с движком от мотоцикла Kawasaki.',
    200,
    2000,
    'Красный',
    'Crossmember',
    FALSE
);

INSERT INTO car (title, photo_url, description, horsepower, production_year, color, suspension_name, is_utilized)
VALUES (
    'Mazda MX-5 Miata',
    'https://cars.pics/mazda_miata.jpg',
    'Лёгкий заднеприводный родстер. Знаком каждому, кто играл в NFS Underground 2.',
    181,
    2022,
    'Красный',
    'Double Wishbone',
    FALSE
);

INSERT INTO car (title, photo_url, description, horsepower, production_year, color, suspension_name, is_utilized)
VALUES (
    'Toyota Supra',
    'https://cars.pics/toyota_supra.jpg',
    'Мотор 2JZ, тюнинг без границ. Такую вы видели только на картинках!',
    330,
    1997,
    'Оранжевый',
    'Double Wishbone',
    FALSE
);

INSERT INTO car (title, photo_url, description, horsepower, production_year, color, suspension_name, is_utilized)
VALUES (
    'Nissan Skyline GT-R',
    'https://cars.pics/nissan_skyline_gtr.jpg',
    'Его знает каждый. Столько игр и фильмов ему посвящено!',
    280,
    1999,
    'Синий',
    'Multi-Link',
    FALSE
);

INSERT INTO car (title, photo_url, description, horsepower, production_year, color, suspension_name, is_utilized)
VALUES (
    'Mitsubishi Lancer Evolution',
    'https://cars.pics/mitsubishi_lancer_evo.jpg',
    'Турбомотор, полный привод. Раллийная машина, которую многие из вас видели.',
    180,
    2005,
    'Красный',
    'MacPherson Strut',
    FALSE
);

INSERT INTO car (title, photo_url, description, horsepower, production_year, color, suspension_name, is_utilized)
VALUES (
    'BMW M3',
    'https://cars.pics/bmw_m3.jpg',
    'Рядная шестёрка, задний привод. Седан, а едет как спорткар.',
    510,
    2021,
    'Серый',
    'Adaptive M Suspension',
    FALSE
);

INSERT INTO car (title, photo_url, description, horsepower, production_year, color, suspension_name, is_utilized)
VALUES (
    'Audi Quattro',
    'https://cars.pics/audi_quattro.jpg',
    'Полный привод и турбонадув. Машина, с которой началась эпоха quattro в ралли.',
    200,
    1984,
    'Белый',
    'MacPherson Strut',
    FALSE
);

INSERT INTO car (title, photo_url, description, horsepower, production_year, color, suspension_name, is_utilized)
VALUES (
    'Peugeot 406',
    'https://cars.pics/peugeot_406.jpg',
    'Такси из Марселя. 3.0 V6, подвеска от 605-й. Только летать она не может=)',
    194,
    1997,
    'Белый',
    'Independent multi-link',
    FALSE
);

INSERT INTO car (title, photo_url, description, horsepower, production_year, color, suspension_name, is_utilized)
VALUES (
    'Porsche 911',
    'https://cars.pics/porsche_911.jpg',
    'Оппозитник сзади. Уже 60 лет не меняют форму кузова. Могут, а зачем?.',
    450,
    2022,
    'Чёрный',
    'Sport Suspension',
    FALSE
);

INSERT INTO car (title, photo_url, description, horsepower, production_year, color, suspension_name, is_utilized)
VALUES (
    'Audi RS2',
    'https://cars.pics/audi_rs2.jpg',
    'Универсал, который доводили сами инженеры из Porsche. Первый RS от Audi.',
    315,
    1994,
    'Синий',
    'Sport Suspension',
    FALSE
);

INSERT INTO car (title, photo_url, description, horsepower, production_year, color, suspension_name, is_utilized)
VALUES (
    'Tesla Model S',
    'https://cars.pics/tesla_model_s.jpg',
    'Только на ней вы можете разогнаться до сотни за две с половиной секунды.',
    1020,
    2023,
    'Белый',
    'Adaptive Suspension',
    FALSE
);


-- заполняем таблицу тренеров
INSERT INTO trainer (first_name, last_name, middle_name, birth_year, bank_account_number, photo_url, favorite_car_id)
VALUES (
    'Доминик',
    'Торрето',
    NULL,
    1967,
    '40702810900000001234',
    '../../image/trainers/dominic_toretto.jpg',
    (SELECT id FROM car WHERE title = 'Nissan Skyline GT-R' LIMIT 1)
);

INSERT INTO trainer (first_name, last_name, middle_name, birth_year, bank_account_number, photo_url, favorite_car_id)
VALUES (
    'Наталья',
    'Пехота',
    'Морская',
    1988,
    '40702810900000001235',
    '../../image/trainers/natalya_morskaya_pehota.jpg',
    (SELECT id FROM car WHERE title = 'BMW M3' LIMIT 1)
);

INSERT INTO trainer (first_name, last_name, middle_name, birth_year, bank_account_number, photo_url, favorite_car_id)
VALUES (
    'Даниэль',
    'Моралес',
    NULL,
    1973,
    '40702810900000001236',
    '../../image/trainers/daniel_morales.jpg',
    (SELECT id FROM car WHERE title = 'Porsche 911' LIMIT 1)
);

INSERT INTO trainer (first_name, last_name, middle_name, birth_year, bank_account_number, photo_url, favorite_car_id)
VALUES (
    'Иван',
    'Иванов',
    NULL,
    1985,
    '40702810900000001237',
    '../../image/trainers/ivan_petrov.jpg',
    (SELECT id FROM car WHERE title = 'Mazda MX-5 Miata' LIMIT 1)
);

INSERT INTO trainer (first_name, last_name, middle_name, birth_year, bank_account_number, photo_url, favorite_car_id)
VALUES (
    'Алексей',
    'Смирнов',
    NULL,
    1992,
    '40702810900000001238',
    '../../image/trainers/alexey_smirnov.jpg',
    (SELECT id FROM car WHERE title = 'Toyota Supra' LIMIT 1)
);

INSERT INTO trainer (first_name, last_name, middle_name, birth_year, bank_account_number, photo_url, favorite_car_id)
VALUES (
    'Мария',
    'Иванова',
    NULL,
    1990,
    '40702810900000001239',
    '../../image/trainers/maria_ivanova.jpg',
    (SELECT id FROM car WHERE title = 'Audi Quattro' LIMIT 1)
);

INSERT INTO trainer (first_name, last_name, middle_name, birth_year, bank_account_number, photo_url, favorite_car_id)
VALUES (
    'Сергей',
    'Кузнецов',
    NULL,
    1983,
    '40702810900000001240',
    '../../image/trainers/sergey_kuznetsov.jpg',
    (SELECT id FROM car WHERE title = 'Audi RS2' LIMIT 1)
);

INSERT INTO trainer (first_name, last_name, middle_name, birth_year, bank_account_number, photo_url, favorite_car_id)
VALUES (
    'Анна',
    'Соколова',
    NULL,
    1995,
    '40702810900000001241',
    '../../image/trainers/anna_sokolova.jpg',
    NULL
);

INSERT INTO trainer (first_name, last_name, middle_name, birth_year, bank_account_number, photo_url, favorite_car_id)
VALUES (
    'Дмитрий',
    'Петров',
    NULL,
    1979,
    '40702810900000001242',
    '../../image/trainers/dmitry_volkov.jpg',
    (SELECT id FROM car WHERE title = 'Tesla Model S' LIMIT 1)
);


-- заполняем таблицу специализации (тренер-авто)
INSERT INTO trainer_car (trainer_id, car_id)
VALUES
(
    (SELECT id FROM trainer WHERE last_name = 'Торрето'),
    (SELECT id FROM car WHERE title = 'Nissan Skyline GT-R' LIMIT 1)
);

INSERT INTO trainer_car (trainer_id, car_id)
VALUES
(
    (SELECT id FROM trainer WHERE last_name = 'Торрето'),
    (SELECT id FROM car WHERE title = 'Mazda MX-5 Miata' LIMIT 1)
);

INSERT INTO trainer_car (trainer_id, car_id)
VALUES
(
    (SELECT id FROM trainer WHERE last_name = 'Торрето'),
    (SELECT id FROM car WHERE title = 'Toyota Supra' LIMIT 1)
);

INSERT INTO trainer_car (trainer_id, car_id)
VALUES
(
    (SELECT id FROM trainer WHERE first_name = 'Даниэль' AND last_name = 'Моралес'),
    (SELECT id FROM car WHERE title = 'Peugeot 406' LIMIT 1)
);

INSERT INTO trainer_car (trainer_id, car_id)
VALUES
(
    (SELECT id FROM trainer WHERE first_name = 'Даниэль' AND last_name = 'Моралес'),
    (SELECT id FROM car WHERE title = 'ОКА' LIMIT 1)
);

INSERT INTO trainer_car (trainer_id, car_id)
VALUES
(
    (SELECT id FROM trainer WHERE first_name = 'Наталья' AND last_name = 'Пехота'),
    (SELECT id FROM car WHERE title = 'Audi Quattro' LIMIT 1)
);

INSERT INTO trainer_car (trainer_id, car_id)
VALUES
(
    (SELECT id FROM trainer WHERE first_name = 'Наталья' AND last_name = 'Пехота'),
    (SELECT id FROM car WHERE title = 'BMW M3' LIMIT 1)
);

INSERT INTO trainer_car (trainer_id, car_id)
VALUES
(
    (SELECT id FROM trainer WHERE first_name = 'Иван' AND last_name = 'Иванов'),
    (SELECT id FROM car WHERE title = 'ВАЗ 2107' LIMIT 1)
);

INSERT INTO trainer_car (trainer_id, car_id)
VALUES
(
    (SELECT id FROM trainer WHERE first_name = 'Иван' AND last_name = 'Иванов'),
    (SELECT id FROM car WHERE title = 'Mitsubishi Lancer Evolution' LIMIT 1)
);

INSERT INTO trainer_car (trainer_id, car_id)
VALUES
(
    (SELECT id FROM trainer WHERE first_name = 'Алексей' AND last_name = 'Смирнов'),
    (SELECT id FROM car WHERE title = 'Toyota Supra' LIMIT 1)
);

INSERT INTO trainer_car (trainer_id, car_id)
VALUES
(
    (SELECT id FROM trainer WHERE first_name = 'Алексей' AND last_name = 'Смирнов'),
    (SELECT id FROM car WHERE title = 'Porsche 911' LIMIT 1)
);

INSERT INTO trainer_car (trainer_id, car_id)
VALUES
(
    (SELECT id FROM trainer WHERE first_name = 'Мария' AND last_name = 'Иванова'),
    (SELECT id FROM car WHERE title = 'Audi RS2' LIMIT 1)
);

INSERT INTO trainer_car (trainer_id, car_id)
VALUES
(
    (SELECT id FROM trainer WHERE first_name = 'Мария' AND last_name = 'Иванова'),
    (SELECT id FROM car WHERE title = 'Audi Quattro' LIMIT 1)
);

INSERT INTO trainer_car (trainer_id, car_id)
VALUES
(
    (SELECT id FROM trainer WHERE first_name = 'Сергей' AND last_name = 'Кузнецов'),
    (SELECT id FROM car WHERE title = 'Audi RS2' LIMIT 1)
);

INSERT INTO trainer_car (trainer_id, car_id)
VALUES
(
    (SELECT id FROM trainer WHERE first_name = 'Сергей' AND last_name = 'Кузнецов'),
    (SELECT id FROM car WHERE title = 'Tesla Model S' LIMIT 1)
);

INSERT INTO trainer_car (trainer_id, car_id)
VALUES
(
    (SELECT id FROM trainer WHERE first_name = 'Анна' AND last_name = 'Соколова'),
    (SELECT id FROM car WHERE title = 'Mazda MX-5 Miata' LIMIT 1)
);

INSERT INTO trainer_car (trainer_id, car_id)
VALUES
(
    (SELECT id FROM trainer WHERE first_name = 'Анна' AND last_name = 'Соколова'),
    (SELECT id FROM car WHERE title = 'ОКА' LIMIT 1)
);

INSERT INTO trainer_car (trainer_id, car_id)
VALUES
(
    (SELECT id FROM trainer WHERE first_name = 'Дмитрий' AND last_name = 'Петров'),
    (SELECT id FROM car WHERE title = 'ВАЗ 2107' LIMIT 1)
);

INSERT INTO trainer_car (trainer_id, car_id)
VALUES
(
    (SELECT id FROM trainer WHERE first_name = 'Дмитрий' AND last_name = 'Петров'),
    (SELECT id FROM car WHERE title = 'BMW M3' LIMIT 1)
);


-- заполняем таблицу соревнований
INSERT INTO competition (name, event_date)
VALUES ('Кубок Поршня', '2023-06-15');

INSERT INTO competition (name, event_date)
VALUES ('Гонка Чемпионов', '2022-09-03');

INSERT INTO competition (name, event_date)
VALUES ('Ралли Монте-Карло', '2021-01-24');

INSERT INTO competition (name, event_date)
VALUES ('Ралли Финляндия', '2020-08-07');

INSERT INTO competition (name, event_date)
VALUES ('Ралли Греция', '2019-06-02');

INSERT INTO competition (name, event_date)
VALUES ('Ралли Уэльс', '2018-10-05');

INSERT INTO competition (name, event_date)
VALUES ('Ралли Мичиган', '2017-07-14');

INSERT INTO competition (name, event_date)
VALUES ('Ралли Испания', '2016-10-16');

INSERT INTO competition (name, event_date)
VALUES ('Ралли Марокко', '2015-04-26');

INSERT INTO competition (name, event_date)
VALUES ('Ралли Австралия', '2014-09-12');


-- заполняем таблицу достижений тренеров
INSERT INTO achievement (trainer_id, competition_id, prize)
VALUES (
    (SELECT id FROM trainer WHERE last_name = 'Торрето'),
    (SELECT id FROM competition WHERE name = 'Кубок Поршня'),
    '1 место'
);

INSERT INTO achievement (trainer_id, competition_id, prize)
VALUES (
    (SELECT id FROM trainer WHERE last_name = 'Торрето'),
    (SELECT id FROM competition WHERE name = 'Гонка Чемпионов'),
    '2 место'
);

INSERT INTO achievement (trainer_id, competition_id, prize)
VALUES (
    (SELECT id FROM trainer WHERE first_name = 'Наталья' AND last_name = 'Пехота'),
    (SELECT id FROM competition WHERE name = 'Ралли Монте-Карло'),
    '1 место'
);

INSERT INTO achievement (trainer_id, competition_id, prize)
VALUES (
    (SELECT id FROM trainer WHERE first_name = 'Наталья' AND last_name = 'Пехота'),
    (SELECT id FROM competition WHERE name = 'Ралли Финляндия'),
    '3 место'
);

INSERT INTO achievement (trainer_id, competition_id, prize)
VALUES (
    (SELECT id FROM trainer WHERE first_name = 'Даниэль' AND last_name = 'Моралес'),
    (SELECT id FROM competition WHERE name = 'Ралли Греция'),
    '1 место'
);

INSERT INTO achievement (trainer_id, competition_id, prize)
VALUES (
    (SELECT id FROM trainer WHERE first_name = 'Даниэль' AND last_name = 'Моралес'),
    (SELECT id FROM competition WHERE name = 'Кубок Поршня'),
    '2 место'
);

INSERT INTO achievement (trainer_id, competition_id, prize)
VALUES (
    (SELECT id FROM trainer WHERE first_name = 'Иван' AND last_name = 'Иванов'),
    (SELECT id FROM competition WHERE name = 'Ралли Мичиган'),
    '2 место'
);

INSERT INTO achievement (trainer_id, competition_id, prize)
VALUES (
    (SELECT id FROM trainer WHERE first_name = 'Алексей' AND last_name = 'Смирнов'),
    (SELECT id FROM competition WHERE name = 'Ралли Испания'),
    '1 место'
);

INSERT INTO achievement (trainer_id, competition_id, prize)
VALUES (
    (SELECT id FROM trainer WHERE first_name = 'Мария' AND last_name = 'Иванова'),
    (SELECT id FROM competition WHERE name = 'Ралли Марокко'),
    '3 место'
);

INSERT INTO achievement (trainer_id, competition_id, prize)
VALUES (
    (SELECT id FROM trainer WHERE first_name = 'Сергей' AND last_name = 'Кузнецов'),
    (SELECT id FROM competition WHERE name = 'Ралли Австралия'),
    '1 место'
);

INSERT INTO achievement (trainer_id, competition_id, prize)
VALUES (
    (SELECT id FROM trainer WHERE first_name = 'Анна' AND last_name = 'Соколова'),
    (SELECT id FROM competition WHERE name = 'Гонка Чемпионов'),
    '1 место'
);

INSERT INTO achievement (trainer_id, competition_id, prize)
VALUES (
    (SELECT id FROM trainer WHERE first_name = 'Дмитрий' AND last_name = 'Петров'),
    (SELECT id FROM competition WHERE name = 'Ралли Монте-Карло'),
    '2 место'
);



