-- Creating the "Friends_Of_Human" database
CREATE DATABASE Friends_Of_Human;

-- Creating tables with hierarchy
USE Friends_Of_Human;

CREATE TABLE Animals (
  animal_id INT PRIMARY KEY,
  name VARCHAR(50),
  command VARCHAR(100),
  birth_date DATE
);

CREATE TABLE Pets (
  home_id INT PRIMARY KEY,
  animal_id INT,
  FOREIGN KEY (animal_idpets) REFERENCES Animals(animal_id)
);

CREATE TABLE Pack_Animals (
  pack_id INT PRIMARY KEY,
  animal_id INT,
  FOREIGN KEY (animal_id) REFERENCES Animals(animal_id)
);

CREATE TABLE Dogs (
  dog_id INT PRIMARY KEY,
  home_id INT,
  FOREIGN KEY (home_id) REFERENCES Pets(home_id)
);

CREATE TABLE Cats (
  cat_id INT PRIMARY KEY,
  home_id INT,
  FOREIGN KEY (home_id) REFERENCES Pets(home_id)
);

CREATE TABLE Hamsters (
  hamster_id INT PRIMARY KEY,
  home_id INT,
  FOREIGN KEY (home_id) REFERENCES Pets(home_id)
);

CREATE TABLE Horses (
  horse_id INT PRIMARY KEY,
  pack_id INT,
  FOREIGN KEY (pack_id) REFERENCES Pack_Animals(pack_id)
);

CREATE TABLE Camels (
  camel_id INT PRIMARY KEY,
  pack_id INT,
  FOREIGN KEY (pack_id) REFERENCES Pack_Animals(pack_id)
);

CREATE TABLE Donkeys (
  donkey_id INT PRIMARY KEY,
  pack_id INT,
  FOREIGN KEY (pack_id) REFERENCES Pack_Animals(pack_id)
);

-- Populating tables with data
USE Friends_Of_Human;

INSERT INTO Animals (animal_id, name, command, birth_date)
VALUES (1, 'Хвостик', 'Лежать', '2015-12-08'),
  (2, 'Мистер Чиз', 'Покушать', '2022-06-09'),
  (3, 'Красотуля', 'Не умереть от испуга', '2002-11-08'),
  (4, 'Буцефал', 'Скакать', '2012-08-05'),
  (5, 'Джонни', 'Игогогать', '2016-10-05'),
  (6, 'Ася', 'Прыгать', '2021-11-12');

INSERT INTO Pets (home_id, animal_id)
VALUES (1, 1),
  (2, 2),
  (3, 3);
  
INSERT INTO Pack_Animals (pack_id, animal_id)
VALUES (1, 4),
  (2, 5),
  (3, 6);
  
-- Linking animals to tables
INSERT INTO Dogs (dog_id, home_id)
VALUES (1, 1);

INSERT INTO Cats (cat_id, home_id)
VALUES (1, 2);

INSERT INTO Hamsters (hamster_id, home_id)
VALUES (1, 3);

INSERT INTO Horses (horse_id, pack_id)
VALUES (1, 1);

INSERT INTO Camels (camel_id, pack_id)
VALUES (1, 2);

INSERT INTO Donkeys (donkey_id, pack_id)
VALUES (1, 3);

-- Removing camels, merging horse and donkey tables
USE Friends_Of_Human;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM Camels;

CREATE TABLE Artiodactyls_animals AS (
  SELECT *
  FROM Horses
  UNION
  SELECT *
  FROM Donkeys
);

-- Creating a new table "young animals" with age calculation
USE Friends_Of_Human;

CREATE TABLE Young_Animals (
  animal_id INT PRIMARY KEY,
  name VARCHAR(50),
  command VARCHAR(100),
  birth_date DATE,
  age_months INT
);

INSERT INTO Young_Animals (animal_id, name, command, birth_date, age_months)
SELECT animal_id,
  name,
  command,
  birth_date,
  TIMESTAMPDIFF(MONTH, birth_date, CURDATE()) AS age_months
FROM Animals
WHERE TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) BETWEEN 1 AND 3;

-- Joining all tables
USE Friends_Of_Human;

CREATE TABLE All_Animals (
  animal_id INT PRIMARY KEY,
  name VARCHAR(50),
  command VARCHAR(100),
  birth_date DATE,
  home_id INT,
  pack_id INT,
  dog_id INT,
  cat_id INT,
  hamster_id INT,
  horse_id INT,
  donkey_id INT,
  FOREIGN KEY (home_id) REFERENCES Pets(home_id),
  FOREIGN KEY (pack_id) REFERENCES Pack_Animals(pack_id),
  FOREIGN KEY (dog_id) REFERENCES Dogs(dog_id),
  FOREIGN KEY (cat_id) REFERENCES Cats(cat_id),
  FOREIGN KEY (hamster_id) REFERENCES Hamsters(hamster_id),
  FOREIGN KEY (horse_id) REFERENCES Horses(horse_id),
  FOREIGN KEY (donkey_id) REFERENCES Donkeys(donkey_id)
);

INSERT INTO All_Animals
SELECT animal.animal_id,
  animal.name,
  animal.command,
  animal.birth_date,
  home.home_id,
  pack.pack_id,
  dog.dog_id,
  cat.cat_id,
  hamster.hamster_id,
  horse.horse_id,
  donkey.donkey_id
FROM Animals AS animal
  LEFT JOIN Pets AS home ON home.animal_id = animal.animal_id
  LEFT JOIN Pack_Animals AS pack ON pack.animal_id = animal.animal_id
  LEFT JOIN Dogs AS dog ON dog.home_id = home.home_id
  LEFT JOIN Cats AS cat ON cat.home_id = home.home_id
  LEFT JOIN Hamsters AS hamster ON hamster.home_id = home.home_id
  LEFT JOIN Horses AS horse ON horse.pack_id = pack.pack_id
  LEFT JOIN Donkeys AS donkey ON donkey.pack_id = pack.pack_id;