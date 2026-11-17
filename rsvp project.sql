use rsvp;

CREATE TABLE Movies (
movie_id INT PRIMARY KEY,
title VARCHAR(100),
release_year YEAR,
genre VARCHAR(50),
language VARCHAR(30),
budget DECIMAL(10,2),
revenue DECIMAL(10,2)
);
-- directors table 
create table directors (
director_id int primary key,
name varchar (100)
);
-- movie_director table 
create table movie_director (
movie_id int,
director_id int,
foreign key (movie_id) references movies(movie_id),
foreign key (director_id) references directors(director_id)
);

-- ratings table 
create table ratings (
movie_id int,
rating decimal (3,1),
foreign key (movie_id) references movies(movie_id)
);

-- Insert Movies
INSERT INTO Movies VALUES
(1, 'Uri: The Surgical Strike', 2019, 'Action', 'Hindi', 25.00,
350.00),
(2, 'Kedarnath', 2018, 'Romance', 'Hindi', 40.00, 100.00),
(3, 'Love Per Square Foot', 2018, 'Comedy', 'Hindi', 20.00, 45.00);
-- Insert Directors
INSERT INTO Directors VALUES
(1, 'Aditya Dhar'),
(2, 'Abhishek Kapoor'),
(3, 'Anand Tiwari');
-- Insert Movie_Director
INSERT INTO Movie_Director VALUES
(1, 1),

(2, 2),
(3, 3);
-- Insert Ratings
INSERT INTO Ratings VALUES
(1, 8.3),
(2, 6.9),
(3, 7.3);

select * from movies
where release_year>2017;

select * from movies
order by revenue desc;
select m.title, r.rating 
from movies m 
join ratings r on m.movie_id = r.movie_id
where r.rating >7;

select d.name as director , m.title as movie 
from directors d 
join movie_director md on d.director_id = md.director_id 
join movies m on md.movie_id = m.movie_id;

SELECT
    title,
    revenue - budget AS Profit
FROM Movies
WHERE revenue > budget
ORDER BY Profit DESC;

select m.genre, avg (r.rating) as avg_rating 
from  movies m 
join ratings r on m.movie_id = r.movie_id 
group by m.genre;

SELECT m.title, r.rating
FROM Movies m
JOIN Ratings r ON m.movie_id = r.movie_id
ORDER BY r.rating DESC
LIMIT 3;


 


