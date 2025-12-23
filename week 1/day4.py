import requests

# 1. Write a script to fetch data from a public API (e.g., GitHub API) and print it.

# text_response = requests.get('https://httpbin.org/get')
# print(text_response.text)
#
# img_resp = requests.get('https://imgs.xkcd.com/comics/python.png')
# with open('pythonImg.png','wb') as f:
#     f.write(img_resp.content)

# 2. How do you pass parameters in a GET request using the requests library?

# parameters are passed in a GET request using 'params=' attribute which takes a dictionary
params = {'page':3, 'count':33}
resp = requests.get('https://httpbin.org/get', params=params)
print(resp.text)
print(resp.url)

# 3. Explain how to handle rate limiting when interacting with an API.

'''
Rate limiting refers to the limiting the number of requests per hour or minute or second
to prevent server from crashing 

Rate limiting can be handled by:
1. Checking the headers for remaining requests in that time frame
2. Waiting until reset. when rate limit is hit, wait by using time.sleep() function 
3. Adding small delays between requests
4. Handling error 429 properly
5. User authentication helps extend rate limits for authenticated user. 
   Anonymous users are assigned strict limits and their requests are tracked using ips while
   authenticated ones are tracked using seperate tokens    

'''

