#!/usr/bin/env python
import argparse
import subprocess
import logging

def run(command, **kwargs):
    logging.info(command)
    return subprocess.run(command, shell=True, check=True, **kwargs)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('search_string')
    arguments = parser.parse_args()
    logging.basicConfig(level=logging.INFO)
    process = run(f"gh pr list --search '{arguments.search_string}'", stdout=subprocess.PIPE, text=True)
    lines = process.stdout.split('\n')
    if len(lines) != 2:
        raise Exception('too many search results')

    pr_number = lines[0].split()[0]
    run(f'gh pr checkout {pr_number}')


if __name__ == '__main__':
    main()
