create or replace view our_second_view as
select t.is_treatmented as answered, count(*) as total_number
from customerservice t
group by t.is_treatmented;
