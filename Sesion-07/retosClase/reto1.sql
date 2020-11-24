#CREATE DATABASE IF NOT EXISTS Alfonso;
use Alfonso;
show tables;

create table if not exists users(
	id int primary key,
    genero varchar(1),
    edad int, 
    ocup int,
    cp varchar(20)
); 


# ########### RETO 1 #############

create table if not exists movies (
   id int primary key, 
   titulo varchar(80), 
   generos varchar(80)
); 

create table if not exists ratings (
   id int primary key auto_increment,
   userid int, 
   movieid int, 
   rating int, 
   fecha int,
   foreign key (userid) references users(id),
   foreign key (movieid) references movies(id)
);


show tables;


#### RETO 2 ###### 

select * from ratings;
select * from movies;
select * from users;




