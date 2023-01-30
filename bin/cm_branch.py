#!/usr/bin/env python
import argparse
import subprocess
import logging

def run(command):
    logging.info(command)
    subprocess.run(command, shell=True, check=True)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('message', nargs='+')
    arguments = parser.parse_args()
    logging.basicConfig(level=logging.INFO)
    message = '-'.join(arguments.message)
    branch_name = message.replace(' ', '-').replace('.', '-')
    run(f'git checkout -b {branch_name}')


if __name__ == '__main__':
    main()
