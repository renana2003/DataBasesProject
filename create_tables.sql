CREATE TABLE Employees
(
  employee_id INT NOT NULL,
  PRIMARY KEY (employee_id)
);

CREATE TABLE CustomerService
(
  request_type VARCHAR(20) NOT NULL,
  customer_service_id INT NOT NULL,
  request_date DATE NOT NULL,
  treatment_date DATE,
  customer_phone VARCHAR(10),
  customer_email VARCHAR(50) NOT NULL,
  request VARCHAR(500) NOT NULL,
  customer_name VARCHAR(50) NOT NULL,
  employee_id INT,
  PRIMARY KEY (customer_service_id),
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Facilities
(
  facility_id INT NOT NULL,
  PRIMARY KEY (facility_id)
);

CREATE TABLE Maintenance
(
  checking_date DATE NOT NULL,
  maintenance_id INT NOT NULL,
  facility_id INT NOT NULL,
  employee_id INT NOT NULL,
  PRIMARY KEY (maintenance_id),
  FOREIGN KEY (facility_id) REFERENCES Facilities(facility_id),
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Fault
(
  fault_id INT NOT NULL,
  fault_description VARCHAR(100) NOT NULL,
  report_date DATE NOT NULL,
  is_treatmented NUMERIC(1) NOT NULL,
  treatment_date INT,
  reporter_employee_id INT NOT NULL,
  repaired_employee_id INT,
  facility_id INT NOT NULL,
  PRIMARY KEY (fault_id),
  FOREIGN KEY (reporter_employee_id) REFERENCES Employees(employee_id),
  FOREIGN KEY (repaired_employee_id) REFERENCES Employees(employee_id),
  FOREIGN KEY (facility_id) REFERENCES Facilities(facility_id)
);
