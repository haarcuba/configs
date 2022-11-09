#!/usr/bin/env python
import argparse
import pprint
import re
import subprocess
import logging

def run(command, **kwargs):
    logging.info(command)
    return subprocess.run(command, shell=True, check=True, **kwargs)

def pr_title(pr_number):
    process = run(f"gh pr view {pr_number}", stdout=subprocess.PIPE, text=True)
    lines = process.stdout.split('\n')
    TITLE = re.compile('title:\s+(?P<title>.*)')
    match = TITLE.search(lines[0])
    return match.groupdict()['title']

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('search_string')
    parser.add_argument('--dry-run', action='store_true')
    parser.add_argument('--yes', action='store_true', help='always checkout the pull request')
    arguments = parser.parse_args()
    logging.basicConfig(level=logging.INFO)
    process = run(f"gh pr list --search '{arguments.search_string}'", stdout=subprocess.PIPE, text=True)
    lines = process.stdout.split('\n')
    if len(lines) != 2:
        pprint.pprint(lines)
        raise Exception(f'too many/not enough search results: {lines}')

    pr_number = lines[0].split()[0]
    logging.info(f'found pull request: {pr_number}')
    title = pr_title(pr_number)
    logging.info(title)
    if arguments.dry_run:
        quit()
    if not arguments.yes:
        answer = input('go ahead? (Y/n) > ')
        if answer.upper() not in ['yes', 'Yes', 'Y', 'y']:
            quit()
    run(f'gh pr checkout {pr_number}')


if __name__ == '__main__':
    main()
