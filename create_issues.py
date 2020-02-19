#!/usr/bin/env python3
import yaml
import dryable
import sys
import pprint
import subprocess
import box
import argparse

@dryable.Dryable()
def run(command):
    process = subprocess.run(command)
    return process.returncode == 0

def show(issue, file=sys.stdout):
    pprint.pprint([issue.title, list(issue.labels), issue.milestone, f'{len(issue.text)} characters'], stream=file)

def error(message):
    print(message, file=sys.stderr)

def verify_correctness(issue):
    if not (set(issue.keys()) >= {'title', 'text', 'milestone', 'labels'}):
        error(f'missing some fields for "{issue.title}"')
        return False
    if '/estimate' not in issue.text:
        error(f'no time estimate for "{issue.title}"')
        return False
    if '"' in issue.text or '"' in issue.title:
        error(f'cannot handle double quotes in "{issue.title}"')
        return False
    for key, value in issue.items():
        if value is None:
            error(f'{key} is None for "{issue.title}"')
            return False

    return True

def create(issue, remote):
    if not verify_correctness(issue):
        return False
    base = ['lab', 'issue', 'create', remote]
    lines = ['-m', issue.title]

    for line in issue.text.splitlines():
        lines.append('-m')
        lines.append(line)

    milestone = ['-m', f'/milestone %{issue.milestone}']
    labels = [ '-l', ','.join(issue.labels) ]


    command = base + lines + milestone + labels
    show(issue)
    return run(command)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('remote', metavar='REMOTE', help='name of git remote to use')
    parser.add_argument('yaml_file', metavar='YAML_FILE')
    parser.add_argument('--dry-run', action='store_true')
    arguments = parser.parse_args()
    dryable.set(arguments.dry_run)
    issues = list(yaml.safe_load_all(open(arguments.yaml_file)))
    errors = []
    for issue in issues:
        issue = box.Box(issue)
        if issue.get('skip', False):
            print(f'skipping "{issue.title}"')
        ok = create(issue, arguments.remote)
        if not ok:
            errors.append(issue)

    print()
    print(f'total of {len(issues)} issues')
    print(f'total errors: {len(errors)}')
    for error in errors:
        show(error, file=sys.stderr)

main()
