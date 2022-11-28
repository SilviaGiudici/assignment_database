select 'most profitable' as feature, title
from movies
where gross - budget = (select max(gross - budget) from movies)
union
select 'least expensive' as feature, title
from movies
where budget = (select min(budget) from movies);