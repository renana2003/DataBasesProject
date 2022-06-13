select tt.customer_service_id, 
       cc.request, 
       tt.sumNumPerformance
from (select t.customer_service_id, sum(numPerformance) as sumNumPerformance
     from(select c.customer_service_id, 
                 c.request, 
                 w.word,
                 (LENGTH(c.request) - LENGTH(REPLACE(c.request, w.word, '')))/LENGTH(w.word) as numPerformance
          from customerservice c, customerservicewords w 
          where c.treatment_date is null
         ) t
     group by t.customer_service_id
     ) tt left join customerservice cc on tt.customer_service_id = cc.customer_service_id
order by tt.sumNumPerformance desc
