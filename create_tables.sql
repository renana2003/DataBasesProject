CREATE TABLE CustomerService
(
  customer_service_id INT NOT NULL,
  request_date DATE NOT NULL,
  treatment_date DATE,
  customer_name VARCHAR(50) NOT NULL,
  customer_phone VARCHAR(15),
  customer_email VARCHAR(50) NOT NULL,
  request VARCHAR(500) NOT NULL,
  is_treatmented NUMERIC(1) NOT NULL,
  employee_id INT,
  PRIMARY KEY (customer_service_id),
  FOREIGN KEY (employee_id) REFERENCES crammer.employee(id)
);

CREATE TABLE Maintenance
(
  checking_date DATE NOT NULL,
  maintenance_id INT NOT NULL,
  facility_id INT NOT NULL,
  employee_id INT NOT NULL,
  PRIMARY KEY (maintenance_id),
  FOREIGN KEY (facility_id) REFERENCES rofridma.facilities(facilities_id),
  FOREIGN KEY (employee_id) REFERENCES crammer.employee(id)
);

CREATE TABLE CustomerServiceWords
(
  word_id INT NOT NULL,
  word VARCHAR(50) NOT NULL,
  PRIMARY KEY (word_id),
  UNIQUE (word)
);

CREATE TABLE Faults
(
  fault_id INT NOT NULL,
  fault_description VARCHAR(100) NOT NULL,
  report_date DATE NOT NULL,
  is_treatmented NUMERIC(1) NOT NULL,
  treatment_date INT,
  fault_level INT NOT NULL,
  reporter_employee_id INT NOT NULL,
  repaired_employee_id INT,
  facility_id INT NOT NULL,
  PRIMARY KEY (fault_id),
  FOREIGN KEY (reporter_employee_id) REFERENCES crammer.employee(id),
  FOREIGN KEY (repaired_employee_id) REFERENCES crammer.employee(id),
  FOREIGN KEY (facility_id) REFERENCES rofridma.facilities(facilities_id)
);