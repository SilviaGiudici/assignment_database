select movies.director, COALESCE(max(gross-budget),-1) AS max, COALESCE(min(gross-budget),-1) AS min, COALESCE(TRUNC(avg(gross-budget)),-1) AS avg 
from (select director 
from directors 
where (yearofbirth - date_part('year', CURRENT_DATE) >= 50)) as oldDirector left join movies
on oldDirector.director = movies.director
group by movies.director;

