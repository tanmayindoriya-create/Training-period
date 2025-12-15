# 1. Write a dictionary comprehension to create a dictionary of numbers and their squares from 1 to 10.

squares = {x : x*x for x in range(1,11)}
print(squares)

# 2. Given a list of dictionaries, sort the list based on a specific key in the dictionaries.

students = [{"name":"A","age":16},{"name":"B","age":14},{"name":"C","age":15}]
students.sort(key= lambda s:s["age"])
print(students)

# 3. Explain the time complexity of checking for an element's existence in a list vs. a set.
"""
Checking an element's existence in a list has a time complexity of O(n) as the list is iterated upon until the element is found of the list ends
while
checking existence of an element in a set has time complexity of O(1) because sets use hash tables to store elements
"""
