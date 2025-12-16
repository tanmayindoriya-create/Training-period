import time
import csv
import json

# 1. Create a DataExtractor class with methods to read from CSV and JSON files.

class DataExtractor:

    def read_CSV(self, file_name):
        with open(file_name, 'r') as file:
            # content = file.read()
            # print(content)

            # content = csv.reader(file)
            # for row in content:
            #     print(row)

            content = csv.DictReader(file)
            for row in content:
                print(row)

    def read_JSON(self, file_name):
        with open(file_name, 'r') as file:
            # content = json.load(file)
            content = file.read()
            print(content)

reader = DataExtractor()
reader.read_JSON("products.json")
reader.read_CSV("products.csv")

# 2. Write a function that takes another function as an argument (a decorator) to log the execution time of the passed function.

def exec_time(fx):
    def wrapper(*args, **kwargs):
        print("calling function", fx.__name__)
        start = time.time()
        fx(*args, **kwargs)
        end = time.time()
        print("Execution time: ", end - start)
    return wrapper

@exec_time
def summation(a,b,c):
    sum = 0
    for i in range(10000000):
        sum+=i
    print(sum)

summation()

# 3. How do you create and raise custom exceptions?
'''
custom functions can be created by inheriting exception class into a new custom class which turns it into a custom function
and raised using the raise keyword
example :- '''

class MyError(Exception):
    def __init__(self, message="this is a custom error"):
        self.message = message
        super().__init__(message)

    def __str__(self):
        return f"{self.message}"

try:
    num = int(input("Enter number:")) # enter a string
except ValueError as e:
    raise MyError() from e
