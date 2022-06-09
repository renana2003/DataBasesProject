create or replace view our_forth_view as
select f1.facility_id, f1.num_of_not, f2.num_of_yes
from (select f.facility_id, count(*) as num_of_not
      from faults f
      where f.is_treatmented = 0
      group by f.facility_id
      ) f1 left join (select h.facility_id, count(*) as num_of_yes
                      from faults h
                      where h.is_treatmented = 1
                      group by h.facility_id
                     ) f2 on f1.facility_id = f2.facility_id
order by f1.facility_id;
