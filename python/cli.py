import argparse
import json
from database import *

parser = argparse.ArgumentParser(description='Get user id')
parser.add_argument('id', type=int, help="Enter user id")

args = parser.parse_args()
id = args.id

with open('users.json') as f:
    data = json.load(f)
    user = data[f'{id}']
    print(user)
