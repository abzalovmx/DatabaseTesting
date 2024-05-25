use hogwarts;
select * from characters;
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
mysql> select * from library;
+--------+---------+--------------------------------------------+------------+------------+---------+
| lib_id | char_id | book_name                                  | start_date | end_date   | book_id |
+--------+---------+--------------------------------------------+------------+------------+---------+
|      1 |       6 | Hogwarts: A History                        | 2010-10-20 | 2020-10-20 |       1 |
|      2 |       7 | Quidditch Through The Ages                 | 2010-11-20 | 2020-11-20 |       2 |
|      3 |       9 | The Lockhart Collection                    | 2015-12-20 | 2030-12-20 |       3 |
|      4 |      10 | Moste Potente Potions                      | 2001-01-20 | 2002-01-20 |       4 |
|      5 |      11 | The Life And Lies Of Albus Dumbledore      | 2018-07-20 | 2028-07-20 |       5 |
|      6 |       4 | Fantastic Beasts And Where To Find Them    | 2010-10-20 | 2020-10-20 |       6 |
|      7 |      13 | The Tales Of Beadle The Bard               | 2003-03-20 | 2004-03-20 |       7 |
|      8 |       3 | Advanced Potion-Making                     | 2003-05-20 | 2006-05-20 |       8 |
|      9 |       2 | A History Of Magic                         | 2012-12-20 | 2022-12-20 |       9 |
|     10 |       1 | Magical Water Plants Of The Highland Rocks | 2006-06-20 | 2010-06-20 |      10 |
|     11 |       8 | Quidditch Through The Ages                 | 2010-11-20 | 2020-11-20 |       2 |
|     12 |      12 | Magical Water Plants Of The Highland Rocks | 2010-11-20 | 2020-10-20 |      10 |
|     13 |       5 | Fantastic Beasts And Where To Find Them    | 2006-06-20 | 2010-00-20 |       6 |
+--------+---------+--------------------------------------------+------------+------------+---------+


/* Выведите имя, фамилию персонажей и название книги, которая на них числится*/
select characters.fname, characters.lname, library.book_name 
from characters
inner join library
on characters.char_id = library.char_id;


# Выведите имя, фамилию персонажей и название книги, вне зависимости от того, есть ли у них книги или нет
select characters.fname, characters.lname, library.book_name 
from characters
left join library
on characters.char_id = library.char_id;

/* Выведите название книги и имя патронуса, 
   вне зависимости от того, есть ли информация о держателе книги в таблице или нет*/
select library.book_name, characters.patronus 
from characters
right join library
on library.char_id = characters.char_id;

/* Выведите имя, фамилию, возраст персонажей и название книги, 
которая на них числится, при условии, что все владельцы книг должны быть старше 15 лет*/
select fname, lname, age, book_name 
from characters 
inner join library
on characters.char_id = library.char_id
where age > 15;

/*Выведите имя персонажа, название книги, дату выдачи и дату завершения, 
при условии, что он младше 15 лет и его патронус неизвестен*/
select fname, book_name, start_date, end_date 
from characters 
inner join library
on characters.char_id = library.char_id
where age < 15 and patronus = 'Unknown';

# Используя вложенный запрос вывидите количество книг, у которых end_date больше, чем end_date у Hermione
select count(lib_id) 
from library 
where end_date > 
(select end_date from library where char_id = 2);

/* С помощью вложенного запроса выведите имена всех патронусов, 
у которых владельцы старше возраста персонажа, у которого патронус Unknown*/
select patronus from characters 
where age > 
(select age from characters where patronus = 'Unknown');

