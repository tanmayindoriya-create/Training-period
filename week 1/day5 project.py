import pandas as pd
import requests
import csv

posts = []
comments = []

for i in range(1,11):
    post_id = i

    post = requests.get(
        f"https://jsonplaceholder.typicode.com/posts/{post_id}"
    ).json()

    comment = requests.get(
        f"https://jsonplaceholder.typicode.com/posts/{post_id}/comments"
    ).json()

    posts.append(post)
    comments.extend(comment)

posts = pd.DataFrame(posts)
comments = pd.DataFrame(comments)

complete = posts.merge(comments, left_on='id', right_on='postId', suffixes=("_post", "_comment"))
posts['comment_count'] = posts['id'].map(
    complete.groupby('postId').size()
)

posts.to_csv('posts_with_comment_counts.csv')