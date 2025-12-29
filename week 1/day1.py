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

# Print/find/remove duplicate elements from an array, without using any inbuilt functions.

arr = [1,6,4,2,8,8,1]

for i in range(len(arr)):
    for j in range(i + 1, len(arr)):
        if arr[i] == arr[j]:
            print(arr[i])
            break

# Write a function that returns indices of the pairs of elements in list L that add up to a number T

L = [2, 7, 11, 15, 3, 6]
T = 9

def pair_indices(L, T):
    seen = {}
    result = []

    for i in range(len(L)):
        needed = T - L[i]

        if needed in seen:
            result.append((seen[needed], i))

        seen[L[i]] = i

    return result

print(pair_indices(L,T))
