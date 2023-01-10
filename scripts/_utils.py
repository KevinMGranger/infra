import requests


def checked(resp: requests.Response) -> requests.Response:
    resp.raise_for_status()
    return resp
