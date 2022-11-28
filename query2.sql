select title 
from movieawards inner join 
(select max(year) as anno
from movies) as recenti 
on anno = movieawards.year
group by title
having count(title) >= 3;
