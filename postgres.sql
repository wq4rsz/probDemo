CREATE TABLE products (
	id int primary key,
	product_name text not null,
	category_name text not null,
	unit_price int not null
);

INSERT INTO products (id, product_name, category_name, unit_price) VALUES 
(1, 'Хлеб', 'Продукты', 50),
(2, 'Молоко', 'Продукты', 80),
(3, 'Бензин', 'Транспорт', 80),
(4, 'Билет в кино', 'Развлечения', 300),
(5, 'Зимнее пальто', 'Одежда', 8500),
(6, 'Учебники', 'Образование', 400),
(7, 'Лекарства', 'Здоровье', 25000),
(8, 'Погашение кредита', 'Кредиты', 89000),
(9, 'Смартфон в подарок', 'Подарки', 99900);


CREATE TABLE family_members (
    id INT PRIMARY KEY,
    members_name TEXT NOT NULL UNIQUE,
    date_of_birth DATE NOT NULL
);

INSERT INTO family_members (id, members_name, date_of_birth) VALUES
(1, 'Иванов Иван Петрович', '1985-06-15'),
(2, 'Иванова Мария Сергеевна', '1987-09-20'),
(3, 'Иванов Алексей Иванович', '2010-02-05'),
(4, 'Иванова Елена Викторовна', '1959-03-10'),
(5, 'Петров Сергей Александрович', '1982-12-05');


CREATE TABLE family_members_job (
    id INT PRIMARY KEY,
    members_name TEXT NOT NULL,
    position_name TEXT NOT NULL,
    organisation_name TEXT NOT NULL,
    salary INT NOT NULL,
    start_date DATE NOT NULL,
    FOREIGN KEY (members_name) REFERENCES family_members(members_name) ON DELETE CASCADE
);

INSERT INTO family_members_job (id, members_name, position_name, organisation_name, salary, start_date) VALUES
(1, 'Иванов Иван Петрович', 'Инженер', 'ООО "ТехноСервис"', 85000, '2015-03-01'),
(2, 'Иванова Мария Сергеевна', 'Бухгалтер', 'АО "ФинансГрупп"', 75000, '2012-04-15'),
(3, 'Иванова Елена Викторовна', 'Репетитор', 'Частная практика', 15000, '2020-01-10'),
(4, 'Петров Сергей Александрович', 'Таксист', 'Индивидуальная работа', 30000, '2020-09-01');


CREATE TABLE expense_products (
    id INT PRIMARY KEY,
    purchase_date DATE NOT NULL,
    members_name TEXT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (members_name) REFERENCES family_members(members_name) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

INSERT INTO expense_products (id, purchase_date, members_name, product_id, quantity) VALUES
(1, '2025-02-01', 'Иванов Иван Петрович', 1, 2),
(2, '2025-02-01', 'Иванов Иван Петрович', 2, 3),
(3, '2025-02-01', 'Иванов Иван Петрович', 2, 1),
(4, '2025-02-06', 'Иванова Мария Сергеевна', 5, 1),
(5, '2025-02-09', 'Петров Сергей Александрович', 3, 30),
(6, '2025-02-12', 'Иванова Елена Викторовна', 7, 5),
(7, '2025-02-18', 'Иванов Иван Петрович', 8, 1),
(8, '2025-02-22', 'Иванова Мария Сергеевна', 9, 1),
(9, '2025-02-22', 'Иванов Алексей Иванович', 4, 1);
