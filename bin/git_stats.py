#!/usr/bin/python3
import argparse
import subprocess
import logging

def output_lines(command):
    logging.debug('run: {command}')
    process = subprocess.run(command, shell=True, check=True, stdout=subprocess.PIPE, text=True)
    lines = process.stdout.split('\n')
    return (line for line in lines if len(line) > 0)

def get_files(ref):
    lines = output_lines(f'git ls-tree  -r --full-name {ref}')
    results = [line.split()[-1] for line in lines]
    return results



def main():
    parser = argparse.ArgumentParser()
    files = get_files('HEAD') 
    import IPython
    IPython.embed()

if __name__ == '__main__':
    main()

