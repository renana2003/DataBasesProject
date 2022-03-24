import csv
import random
from faker import Faker


def main():
    # csv header
    faultfieldnames = ['fault_id', 'facility_id', 'fault_description', 'reporter_employee_id', 'report_date',
                       'is_treatmented', 'treatment_date', 'repaired_employee_id']

    # csv data
    rows1 = make_faults(1000)
    with open('faults.csv', 'w', encoding='UTF8', newline='') as faults:
        writer = csv.DictWriter(faults, fieldnames=faultfieldnames)
        writer.writeheader()
        writer.writerows(rows1)

    # csv header
    customerservicefieldnames = ['customer_service_id', 'employee_id', 'request_date', 'treatment_date', 'customer_phone', 'customer_email', 'request', 'customer_name']

    # csv data
    rows2 = make_requests(20000)
    with open('customerservices.csv', 'w', encoding='UTF8', newline='') as faults:
        writer = csv.DictWriter(faults, fieldnames=customerservicefieldnames)
        writer.writeheader()
        writer.writerows(rows2)


def make_faults(num):
    # lists to randomly assign to workers
    fake = Faker()

    fake_faults = []

    for x in range(num):
        report_date = fake.date_between(start_date='-2y', end_date='today')
        is_treatmented = random.randint(0, 1)
        treatment_date = None
        repaired_employee_id = 0
        
        if is_treatmented:
            treatment_date = fake.date_between(start_date=report_date, end_date='today')
            repaired_employee_id = random.randint(1, 1000)

        fake_fault = {'fault_id': x + 1000,
                         'facility_id': random.randint(1, 100),
                         'fault_description': fake.text(),
                         'reporter_employee_id': random.randint(1, 1000),
                         'report_date': report_date,
                         'is_treatmented': is_treatmented,
                         'treatment_date': treatment_date,
                         'repaired_employee_id': repaired_employee_id
                        }
        fake_faults.append(fake_fault)

    return fake_faults


def phn():
    n = '0500000000'
    while '9' in n[3:6] or n[3:6]=='000' or n[6]==n[7]==n[8]==n[9]:
        n = n[:2] + str(random.randint(10**7, 10**8-1))
    return n


def make_requests(num):
    # lists to randomly assign to workers
    fake = Faker()

    fake_requests = []

    for x in range(num):
        request_date = fake.date_between(start_date='-2y', end_date='today')

        fake_request = {'customer_service_id': x + 1000,
                         'employee_id': random.randint(1, 1000),
                         'request_date': request_date,
                         'treatment_date': fake.date_between(start_date=request_date, end_date='today'),
                         'customer_phone': phn(),
                         'customer_email': fake.email(),
                         'request': fake.text(),
                         'customer_name': fake.name()
                          }
        fake_requests.append(fake_request)

    return fake_requests


if __name__ == '__main__':
    main()