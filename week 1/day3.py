import numpy as np
import pandas as pd

courses = pd.read_csv('courses.csv')
students = pd.read_csv('students.csv')
nov = pd.read_csv('reg-month1.csv')
dec = pd.read_csv('reg-month2.csv')
reg = pd.concat([nov, dec], ignore_index=True)

data = {
    "Order ID": [1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010, 1011, 1012],
    "Date": [
        "2024-01-05", "2024-01-07", "2024-01-08", "2024-01-10",
        "2024-01-12", "2024-01-14", "2024-01-15", "2024-01-18",
        "2024-01-20", "2024-01-22", "2024-01-25", "2024-01-28"
    ],
    "Region": [
        "North", "South", "East", "West",
        "North", "South", "East", "West",
        "North", "South", "East", "West"
    ],
    "Product_Category": [
        "Electronics", "Furniture", "Electronics", "Office Supplies",
        "Furniture", "Electronics", "Office Supplies", "Electronics",
        "Office Supplies", "Furniture", "Furniture", "Office Supplies"
    ],
    "Product_Name": [
        "Laptop", "Office Chair", "Smartphone", "Printer Paper",
        "Desk", "Tablet", "Pens", "Monitor",
        "Stapler", "Bookshelf", "Filing Cabinet", "Envelopes"
    ],
    "Sales_Amount": [1200, 350, 800, 75, 600, 450, 40, 300, 25, 500, 420, 60]
}
df = pd.DataFrame(data)
df["Date"] = pd.to_datetime(df["Date"])

# 1. Given two DataFrames, perform an outer join to combine them.

print(reg.merge(courses, on='course_id', how='outer'))

# 2. Create a pivot table to summarize sales data by region and product category.

print(
    df.pivot_table(
    index='Region',
    columns='Product_Category',
    values='Sales_Amount',
    aggfunc=['mean', 'sum', 'min', 'max']
)
)

# 3. What is the difference between merge() and join() in Pandas?

'''
merge -> column based joining
    df.merge(df2,how=type_of_join, on=[column or columns])    
    or
    pd.merge(left_df, right_df,how=type_of_join, on=[column or columns]) 
    
    column naming conflicts are self resolved. can be done explicitly using suffixes= attribute 
    
    used for relational data

join -> index based joining
        there is a need to set index first using df.set_index(column or columns)
    df.join(df2, on=index, how=type_of_join)

    column conflicts must be explictly resolved using suffixes= attribute
    
    used for index based data
'''