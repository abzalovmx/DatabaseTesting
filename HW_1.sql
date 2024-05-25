use hogwarts;
+---------+----------+------------+------+------------+----------------------+---------+
| char_id | fname    | lname      | age  | faculty    | patronus             | book_id |
+---------+----------+------------+------+------------+----------------------+---------+
|       1 | Harry    | Potter     |   11 | Gryffindor | Stag                 |      10 |
|       2 | Hermione | Granger    |   11 | Gryffindor | Otter                |       9 |
|       3 | Ron      | Weasley    |   11 | Gryffindor | Jack Russell terrier |       8 |
|       4 | Draco    | Malfoy     |   11 | Slytherin  | NULL                 |       6 |
|       5 | Vincent  | Crabbe     |   11 | Slytherin  | NULL                 |       6 |
|       6 | Gregory  | Goyle      |   11 | Slytherin  | NULL                 |       1 |
|       7 | Albus    | Dumbledore |  111 | Gryffindor | Phoenix              |       2 |
|       8 | Luna     | Lovegood   |   11 | Ravenclaw  | Hare                 |       2 |
|       9 | Cedric   | Diggory    |   14 | Hufflepuff | Unknown              |       3 |
|      10 | Severus  | Snape      |   55 | Slytherin  | Doe                  |       4 |
+---------+----------+------------+------+------------+----------------------+---------+

/* Выведите имя, фамилию, патронуса всех персонажей, у которых есть patronus и он известен*/
select fname, lname, patronus from characters where patronus is not null;


# Выведите фамилию персонажей, у которых последняя буква в фамилии ‘e’
select lname as Last_name from characters where lname like '%e';


# Посчитайте общий возраст всех персонажей и выведите это на экран
select sum(age) Total_age from characters;


# Выведите имя, фамилию и возраст персонажей по убыванию их возраста
select fname, lname, age from characters order by age desc;


# Выведите имя персонажа и возраст, у которых последний находится в диапазоне от 50 до 100 лет
select fname, age from characters where age between 50 and 100;
select fname, age from characters where age >= 50 and age <= 100;


# Выведите возраст всех персонажей так, чтобы среди них не было тех, у кого он одинаковый
select distinct age as unique_age from characters;


# Выведите всю информацию о персонажах, у которых faculty = Gryffindor и чей возраст больше 30 лет
select * from characters where faculty = 'Gryffindor' and age > 30;


# Выведите имена первых трех факультетов из таблицы, так чтобы факультеты не повторялись
select distinct faculty from characters limit 3;


 /* Выведите имена всех персонажей, 
у которых имя начинается с ‘H’ и состоит из 5 букв, или чье имя начинается с ‘L’ */
select fname from characters where fname like 'H____' or fname like 'L%';


# Посчитайте средний возраст всех персонажей
select avg(age) as averege_age from characters;


# Удалите персонажа с ID = 11
delete from characters where char_id = 11;


# Выведите фамилию всех персонажей, которые содержат в ней букву ‘a’
select lname from characters where lname like '%a%';


/* Используйте псевдоним для того, 
чтобы временно замените название столбца fname на Half-Blood Prince для реального принца-полукровки*/
select fname as Half_Blood_Prince from characters where char_id = 10;


# Выведите id и имена всех патронусов в алфавитном порядки, при условии что они есть или известны
select char_id, patronus from characters 
where patronus is not null and char_id is not null
order by patronus desc;


# Используя оператор IN, выведите имя и фамилию тех персонажей, у которых фамилия Crabbe, Granger или Diggory
select fname, lname from characters where lname in ('Crabbe', 'Granger', 'Diggory');


# Выведите минимальный возраст персонажа
select min(age) as minimal_age from characters;


# Используя оператор UNION выберите имена из таблицы characters и названия книг из таблицы library
select fname as names_and_books from characters union select book_name from library;


/* Используя оператор HAVING посчитайте количество персонажей на каждом факультете, 
оставив только те факультеты, где количество студентов больше 1*/
select faculty, count(char_id) count_of_students from characters group by faculty having count_of_students > 1;


/*Используя оператор 'CASE' опишите следующую логику:
Выведите имя и фамилию персонажа, а также следующий текстовое сообщение:
Если факультет Gryffindor, то в консоли должно вывестись Godric
Если факультет Slytherin, то в консоли должно вывестись Salazar
Если факультет Ravenclaw, то в консоли должно вывестись Rowena
Если факультет Hufflepuff, то в консоли должно вывестись Helga
Если другая информация, то выводится Muggle
Для сообщения используйте псевдоним Founders*/
select fname, lname, 
case
	when faculty = 'Gryffindor' then 'Godric'
    when faculty = 'Slytherin' then 'Salazar'
    when faculty = 'Ravenclaw' then 'Rowena'
    when faculty = 'Hufflepuff' then 'Helga'
    else 'Muggle'
end as Founders
from characters;



/* Используя регулярное выражение найдите фамилии персонажей, 
которые не начинаются с букв H, L или S и выведите их*/
SELECT * 
FROM characters 
WHERE fname not REGEXP '^H|^L|^S';
