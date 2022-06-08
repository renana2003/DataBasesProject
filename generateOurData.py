import csv
import random
from faker import Faker

fake = Faker()


def main():

    # csv data
    rows1 = make_faults(2000)
    with open('faults.csv', 'w', encoding='UTF8', newline='') as faults:
        writer = csv.DictWriter(faults, fieldnames=rows1[0].keys())
        writer.writeheader()
        writer.writerows(rows1)

    # csv data
    rows2 = make_requests(20000)
    with open('customerservices.csv', 'w', encoding='UTF8', newline='') as faults:
        writer = csv.DictWriter(faults, fieldnames=rows2[0].keys())
        writer.writeheader()
        writer.writerows(rows2)


def make_faults(num):
    # lists to randomly assign to workers

    fake_faults = []

    for x in range(num):
        report_date = fake.date_between(start_date='-2y', end_date='today')
        is_treatmented = random.randint(0, 1)
        treatment_date = None
        repaired_employee_id = None
        
        if is_treatmented:
            treatment_date = fake.date_between(start_date=report_date, end_date='today')
            repaired_employee_id = get_employee_id()

        fake_fault = {
            'fault_id': x + 1,
            'fault_description': fake.text(50),
            'report_date': report_date,
            'is_treatmented': is_treatmented,
            'treatment_date': treatment_date,
            'fault_level': random.randint(1, 5),
            'reporter_employee_id': get_employee_id(),
            'repaired_employee_id': repaired_employee_id,
            'facility_id': get_facility_id()
        }
        fake_faults.append(fake_fault)

    return fake_faults


def make_requests(num):
    # lists to randomly assign to workers

    fake_requests = []

    for x in range(num):
        request_date = fake.date_between(start_date='-2y', end_date='today')
        is_treatmented = random.randint(0, 1)
        treatment_date = None
        employee_id = None
        if is_treatmented:
            treatment_date = fake.date_between(start_date=request_date, end_date='today'),
            employee_id = get_employee_id()

        fake_request = {
            'customer_service_id': x + 1,
            'request_date': request_date,
            'treatment_date': treatment_date,
            'customer_name': fake.name(),
            'customer_phone': get_phn(),
            'customer_email': fake.email(),
            'request': fake.text(50),
            'is_treatmented': is_treatmented,
            'employee_id': employee_id
        }
        fake_requests.append(fake_request)

    return fake_requests


def get_phn():
    n = '0500000000'
    while '9' in n[3:6] or n[3:6]=='000' or n[6]==n[7]==n[8]==n[9]:
        n = n[:2] + str(random.randint(10**7, 10**8-1))
    return n


def get_employee_id():
    return random.randint(888888, 908887)


def get_facility_id():
    return random.randint(1, 1000)


if __name__ == '__main__':
    main()
