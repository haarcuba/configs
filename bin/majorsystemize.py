#!/usr/bin/python

import sys
import argparse

_MAP = {'0': 'z',
       '1': 't',
       '2': 'n',
       '3': 'M',
       '4': 'R',
       '5': 'L',
       '6': 'j',
       '7': 'k',
       '8': 'f',
       '9': 'b',}

def major_system(char):
    return _MAP[char]


parser = argparse.ArgumentParser(description='read input line by line, turn digits into major system characters')
arguments = parser.parse_args()

for line in sys.stdin:
    new_line = ''
    for char in line:
        if char.isdigit():
            new_line += major_system(char)
        else:
            new_line += char

    sys.stdout.write(new_line)
