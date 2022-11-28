WITH winners AS
(select director 
from directorawards 
where award like '%oscar%' and result = 'won'
union
select director 
from movieawards natural join movies
where award like '%oscar%' and result = 'won')
select distinct director, 'youngest' as feature
from winners natural join directors
where yearofbirth = (select max(yearofbirth)
    from winners natural join directors)
union
select distinct director, 'oldest' as feature
from winners natural join directors
where yearofbirth = (select min(yearofbirth)
    from winners natural join directors);