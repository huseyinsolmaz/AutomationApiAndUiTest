import requests


def get_image_request(path):
    response = requests.get(path)
    return response.status_code

