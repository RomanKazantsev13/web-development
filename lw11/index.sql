-- удаляем прежнюю базу даных
DROP DATABASE university
;

-- создфем новую базу данных university
CREATE DATABASE university
;

-- выбираем базу данных для использования
USE university
;

-- создаем таблицу faculty
CREATE TABLE `faculty`
(
    id_faculty            INT AUTO_INCREMENT  PRIMARY KEY,
    name                  VARCHAR(255)        NOT NULL
) DEFAULT CHARACTER SET utf8mb4
  COLLATE `utf8mb4_unicode_ci`
  ENGINE = InnoDB
;

-- добавляем в таблицу faculty 3 факультета
INSERT INTO `faculty` (name) VALUES
    ("Faculty of computer science and computer engineering"),
    ("Radio engineering faculty"),
    ("Institut of construction and architecture")
;

-- создаем таблицу group
CREATE TABLE `group_uni`
(
    id_group              INT AUTO_INCREMENT  PRIMARY KEY,
    name                  VARCHAR(255)        NOT NULL   ,
    id_faculty            INT                         
) DEFAULT CHARACTER SET utf8mb4
  COLLATE `utf8mb4_unicode_ci`
  ENGINE = InnoDB
;

-- добавляем в таблицу group 9 групп (по 3 для каждого факульета)
INSERT INTO `group_uni` (name, id_faculty) VALUES
    ('Software engeneering',                                     1),
    ('Information security',                                     1),
    ('Computer science and engineering',                         1),
    ('Electronics and nanoelectronics',                          2),
    ('Infocommunication technologies and communication systems', 2),
    ('Radio engineering',                                        2),
    ('Architecture',                                             3),
    ('Construction',                                             3),
    ('Technosphere security',                                    3)
;

-- создаем таблицу student
CREATE TABLE `student`
(
    id_student        INT AUTO_INCREMENT PRIMARY KEY,
    first_name        VARCHAR(255)     NOT NULL,
    last_name         VARCHAR(255)     NOT NULL,
    age               INT,
    id_group          INT
) DEFAULT CHARACTER SET utf8mb4
  COLLATE `utf8mb4_unicode_ci`
  ENGINE = InnoDB
;

-- добавляем в таблицу student 45 студентов (по 5 студентов в каждой группе (всего 9 групп (по 3 группы в каждом факульете) ) )
INSERT INTO `student` (first_name, last_name, age, id_group) VALUES
  ('Ivan', 'Fedorov',         19, 1),
  ('Andrey', 'Bysygin',       18, 2),
  ('Kirill', 'Kalinin',       17, 3),
  ('Svetlana', 'Dimova',      18, 4),
  ('Nadya', 'Fedyashina',     18, 5),
  ('Nikita', 'Lezin',         21, 6),
  ('Katerina', 'Potehina',    21, 7),
  ('Olga', 'Miller',          20, 8),
  ('Olesya', 'Evteeva',       19, 9),
  ('Natalya', 'Demidova',     20, 1),
  ('Ruslan', 'Rustemovich',   18, 2),
  ('Mariya', 'Moskvicheva',   19, 3),
  ('Maksim', 'Martinenko',    19, 4),
  ('Mariya', 'Reitman',       18, 5),
  ('Dmitriy', 'Kotenko',      17, 6),
  ('Tolya', 'Kyznetsov',      21, 7),
  ('Angelina', 'Savostikova', 20, 8),
  ('Emil', 'Ahmetzyanov',     20, 9),
  ('Ekaterina', 'Rybtsova',   23, 1),
  ('Lydmila', 'Protrasova',   18, 2),
  ('Anya', 'Starikova',       19, 3),
  ('Valentina', 'Glazleva',   18, 4),
  ('Ivan', 'Komarov',         18, 5),
  ('Denis', 'Krilov',         19, 6),
  ('Boris', 'Astahov',        21, 7),
  ('Olga', 'Bogdanovna',      19, 8),
  ('Igor', 'Vadimov',         20, 9),
  ('Elena', 'Stepanova',      20, 1),
  ('Viktoriya', 'Pehota',     18, 2),
  ('Sergey', 'Kirsanov',      18, 3),
  ('Alena', 'Nosova',         18, 4),
  ('Alexandr', 'Boyarko',     18, 5),
  ('Ivan', 'Ivanov',          19, 6),
  ('Evgeniy', 'Fedorov',      21, 7),
  ('Dmitriy', 'Kern',         20, 8),
  ('Lera', 'Romantika',       22, 9),
  ('Oleg', 'Silnov',          20, 1),
  ('Valentin', 'Syvorov',     18, 2),
  ('Pavel', 'Savelev',        19, 3),
  ('Petr', 'Kirillov',        19, 4),
  ('Denis', 'Sergeev',        18, 5),
  ('Pasha', 'Kopytov',        19, 6),
  ('Ivan', 'Goryachev',       21, 7),
  ('Andrey', 'Moikin',        21, 8),
  ('Anton', 'Romanov',        20, 9)
;

-- Для получения всех студентов в возрасте 19 лет
SELECT 
    first_name AS "First Name", 
    last_name  AS "Last Name",
    age        AS "Age"
FROM 
    student
WHERE
    age = 19
;

-- Для получения всех студентов из конкретной группы
SELECT 
    student.first_name AS "First Name", 
    student.last_name  AS "Last Name",
    group_uni.name     AS "Group"
FROM 
    group_uni
LEFT JOIN 
    student
ON
    student.id_group = group_uni.id_group 
WHERE 
    group_uni.name =  'Computer science and engineering'
;

-- Для получения всех студентов из конкретного факультета
SELECT 
    student.first_name AS "First Name", 
    student.last_name  AS "Last Name",
    faculty.name       AS "Faculty"
FROM 
    group_uni
LEFT JOIN
    student
ON  
    student.id_group = group_uni.id_group
LEFT JOIN
    faculty 
ON
    faculty.id_faculty = group_uni.id_faculty
WHERE
    faculty.name = "Radio engineering faculty"     
;

-- Для получения факультета и группы конкретного студента
SELECT  
    student.first_name AS "First Name",
    student.last_name  AS "Last Name",
    faculty.name       AS "Faculty",
    group_uni.name     AS "Group"
FROM 
    group_uni
LEFT JOIN
    student
ON  
    student.id_group = group_uni.id_group
LEFT JOIN
    faculty 
ON
    faculty.id_faculty = group_uni.id_faculty
WHERE
    student.first_name = "Elena" && student.last_name = "Stepanova" 
;
    
