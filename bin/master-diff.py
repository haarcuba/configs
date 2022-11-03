#!/usr/bin/env python
import logging
import uuid
import argparse
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
    logging.basicConfig(level=logging.INFO, format='%(asctime)s %(levelname)s: %(message)s')
    parser = argparse.ArgumentParser()
    _, arguments = parser.parse_known_args()
    starting_branch = find_current_branch()
    logging.info(f'current branch: {starting_branch}')
    temporary_branch = f'MASTER-DIFF-{uuid.uuid4()}'
    run(f'git checkout -b {temporary_branch}', silent=True)
    run(f"git merge origin/master -m 'MATER-DIFF AUTOMERGE'", silent=True)
    delegated_arguments = ' '.join(arguments)
    run(f'git diff origin/master..HEAD {delegated_arguments}')
    run(f'git checkout {starting_branch}', silent=True)
    run(f'git branch -D {temporary_branch}', silent=True)

if __name__ == '__main__':
    main()
