create or replace package LunaPark is

  -- Author  : KENIGSBU
  -- Created : 08/06/2022 21:21:17
  -- Purpose : help handle faults and maintenance of facilities and customer service requests
  
  -- Public function and procedure declarations
  function getUntreatmentedFaults(fy_id integer) return integer;
  function checkIfTreatmentedCs(cs_id integer) return boolean;
  procedure printFault(ft_id integer);
  procedure printMaintenance(m_id integer);
  procedure printCustomerService(cs_id integer);
  procedure removeFacilityData(fy_id integer);
  procedure updateService(cs_id in customerservice.customer_service_id%type, e_id in customerservice.employee_id%type);

end LunaPark;
/
create or replace package body LunaPark is

  -- Function and procedure implementations
  function getUntreatmentedFaults(fy_id integer) return integer is
    cursor faultsCursor is select * from faults t where t.is_treatmented = 0;
    number_of_fault integer;
    f faultsCursor%rowtype;
  begin
    dbms_output.put_line('The unrepaired fault in facility ' || fy_id || ':');
    dbms_output.new_line();
    number_of_fault := 0;
    for f in faultsCursor
      loop
        if f.facility_id = fy_id then
          printFault(f.fault_id);
          number_of_fault := number_of_fault + 1;
        end if;
      end loop;
    return number_of_fault;
  end;
  
  function checkIfTreatmentedCs(cs_id integer) return boolean is
    cs customerservice%rowtype;
  begin
    select * into cs from customerservice c where c.customer_service_id = cs_id;
    return sys.diutil.int_to_bool(cs.is_treatmented);
  end;
  
  procedure printFault(ft_id integer) is
    cursor faultsCursor is select * from faults t;
    f faultsCursor%rowtype;
  begin
      for f in faultsCursor
      loop
        if f.fault_id = ft_id then
          dbms_output.put_line('_______ Fault _______');
          dbms_output.put_line('fault number: ' || f.fault_id);
          dbms_output.put_line('report date: ' || f.report_date);
          dbms_output.put_line('description: ' || f.fault_description);
          dbms_output.put_line('level: ' || f.fault_level);
          dbms_output.put_line('_____________________');
          dbms_output.new_line();
        end if;
      end loop;
    end;
    
  procedure printMaintenance(m_id integer) is
    cursor maintenanceCursor is select * from maintenance t;
    m maintenanceCursor%rowtype;
  begin
      for m in maintenanceCursor
      loop
        if m.maintenance_id = m_id then
          dbms_output.put_line('_______ Maintenance _______');
          dbms_output.put_line('maintenance number: ' || m.maintenance_id);
          dbms_output.put_line('date: ' || m.checking_date);
          dbms_output.put_line('___________________________');
          dbms_output.new_line();
        end if;
      end loop;
    end;

  procedure printCustomerService(cs_id integer) is
    cursor csCursor is select * from customerservice t;
    cs csCursor%rowtype;
  begin
      for cs in csCursor
      loop
        if cs.customer_service_id = cs_id then
          dbms_output.put_line('_______ CustomerService _______');
          dbms_output.put_line('customerservice number: ' || cs.customer_service_id);
          dbms_output.put_line('report date: ' || cs.request_date);
          dbms_output.put_line('treatment date: ' || cs.treatment_date);
          dbms_output.put_line('employee: ' || cs.employee_id);
          dbms_output.put_line('_______________________________');
          dbms_output.new_line();
        end if;
      end loop;
    end;
  
  procedure removeFacilityData(fy_id integer) is
    cursor faultsCursor is select * from faults t where t.facility_id = fy_id;
    cursor maintenanceCursor is select * from maintenance t where t.facility_id = fy_id;
    f faultsCursor%rowtype;
    m maintenanceCursor%rowtype;
    num_count integer;
  begin
    dbms_output.put_line('Delete all the data of facility ' || fy_id || ':');
    dbms_output.new_line();
    num_count := 0;
    for f in faultsCursor
      loop
        if f.facility_id = fy_id then
          printFault(f.fault_id);
          DELETE FROM faults f_t WHERE f_t.fault_id = f.fault_id;
          num_count := num_count + 1;
        end if;
      end loop;
    for m in maintenanceCursor
      loop
        if m.facility_id = fy_id then
          printMaintenance(m.maintenance_id);
          DELETE FROM maintenance m_t WHERE m_t.maintenance_id = m.maintenance_id;
          num_count := num_count + 1;
        end if;
      end loop;
    dbms_output.put_line(num_count || ' rows deleted');
  end;
  
  
  procedure updateService(cs_id in customerservice.customer_service_id%type, e_id in customerservice.employee_id%type) is
    valid boolean;
  begin
    valid := checkIfTreatmentedCs(cs_id);
    dbms_output.put_line('validaition: ' || sys.diutil.bool_to_int(valid));
    
    if not valid then
        update customerservice c set c.employee_id = e_id, c.treatment_date = CURRENT_DATE where c.customer_service_id = cs_id;
        commit;
        dbms_output.new_line();
        dbms_output.put_line('row updated! ');
        printCustomerService(cs_id);
    end if;
  end; 
  
end LunaPark;
/
