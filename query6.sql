select title
from movieawards
where award = 'Oscar' and result = 'won'
group by title
having count(award) = (
    select max(c) from 
    (   
        select count(award) as c 
        from movieawards
        where award = 'Oscar' and result = 'won'
        group by title
    ) as massimo
);