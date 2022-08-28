#!/usr/bin/env python
import logging
import argparse
import uuid
import subprocess

def run(command, silent=False, **kwargs):
    if silent:
        kwargs['stdout'] = subprocess.DEVNULL
    logging.info(f'run: {command}')
    return subprocess.run(command, check=True, shell=True, **kwargs)

def find_current_branch():
    process = run('git branch --show-current', stdout=subprocess.PIPE, text=True)
    return process.stdout.strip()

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('other_branch', help='branch to try and merge with current branch')
    arguments = parser.parse_args()
    logging.basicConfig(level=logging.INFO, format='%(asctime)s %(levelname)s: %(message)s')
    starting_branch = find_current_branch()
    logging.info(f'current branch: {starting_branch}')
    temporary_branch = f'MERGABLE-{uuid.uuid4()}'
    run(f'git checkout -b {temporary_branch}', silent=True)
    try:
        run(f"git merge {arguments.other_branch} -m 'MERGABLE AUTOMERGE'")
    finally:
        run(f'git checkout {starting_branch}', silent=True)
        run(f'git branch -D {temporary_branch}', silent=True)

if __name__ == '__main__':
    main()

