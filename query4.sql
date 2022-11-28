select award, year, director
from (
    select directors.director from 
    directors natural join movies
    group by director
    having sum(gross) > 1000000
) as altiIncassi natural join directorawards
where result = "won"
order by (award, year, director);