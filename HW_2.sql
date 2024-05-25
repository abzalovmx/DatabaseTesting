use hogwarts;

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

