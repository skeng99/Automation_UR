from faker import Faker
from robot.api.deco import keyword
import random

fake = Faker()
first_name: str


@keyword
def generate_random_first_name():
    global first_name
    first_name = fake.first_name()
    return first_name


@keyword
def generate_random_last_name():
    return fake.last_name()


@keyword
def generate_random_email():
    email = first_name + '@getnada.com'
    return email


@keyword
def generate_random_age():
    return random.randint(0, 100)


@keyword
def generate_random_choice():
    option = [1, 2, 3]
    return random.choice(option)
