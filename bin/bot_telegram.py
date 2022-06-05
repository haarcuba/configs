#!/usr/bin/python
import pathlib
import pprint
import requests
import argparse
import yaml

def updates(bot, more_arguments):
    token = bot['token']
    response = requests.get(f'https://api.telegram.org/bot{token}/getUpdates')
    pprint.pprint(response.json())

def send(bot, more_arguments):
    token = bot['token']
    chat_id = bot['chat_id']
    parser = argparse.ArgumentParser()
    parser.add_argument('message')
    arguments = parser.parse_args(more_arguments)
    parameters = {'chat_id': chat_id, 'text': arguments.message }
    response = requests.post(f'https://api.telegram.org/bot{token}/sendMessage', json=parameters)
    pprint.pprint(response.json())

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('bot')
    parser.add_argument('method')
    arguments, more_arguments = parser.parse_known_args()
    bots_file = pathlib.Path.home() / 'bots.yaml'
    config = yaml.safe_load(bots_file.read_text())
    bot = config[arguments.bot]
    handlers = {'updates': updates, 'send': send}
    handler = handlers[arguments.method]
    handler(bot, more_arguments)

if __name__ == '__main__':
    main()
