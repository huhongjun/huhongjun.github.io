import requests
import os
import json

docker_user = os.environ['DOCKER_USER']
docker_pass = os.environ['DOCKER_PASS']
docker_org = os.environ['DOCKER_ORG']
docker_repo = os.environ['DOCKER_REPO']

page_size = 100

r = requests.post(
    'https://hub.docker.com/v2/users/login/',
    headers={'Content-Type': 'application/json'},
    json={
        'username': docker_user,
        'password': docker_pass,
    },
)

token = json.loads(r.text)['token']

headers = {
    'Content-Type': 'application/json',
    'Authorization': f'JWT {token}',
}

r = requests.get(
    f'https://hub.docker.com/v2/repositories/{docker_org}/{docker_repo}/tags?page_size={page_size}',
    headers=headers,
)

tags = []

while True:
    j = json.loads(r.text)
    batch = j['results']
    next_page = j['next']

    tags += batch

    if next_page is None:
        break

    r = requests.get(next_page, headers=headers)

for t in tags:
    print(t['name'])