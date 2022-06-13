create or replace view our_first_view as
select e.name, f.numofcs
from (select t.employee_id, count(t.customer_service_id) as numOfCS
      from customerservice t
      where t.request_date > (CURRENT_DATE - 365) and t.is_treatmented = 1
      group by t.employee_id) f left join CRAMMER.EMPLOYEE e on e.id = f.employee_id
where f.numofcs = (select max(h.numofcs)
                   from (select c.employee_id, count(c.customer_service_id) as numOfCS
                          from customerservice c
                          where c.request_date > (CURRENT_DATE - 365) and c.is_treatmented = 1
                          group by c.employee_id) h)
order by f.numofcs desc;
