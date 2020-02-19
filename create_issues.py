#!/usr/bin/env python3
import yaml
import dryable
import pprint
import subprocess
import box
import argparse

@dryable.Dryable()
def run(command):
    subprocess.run(command)

def create(issue, remote):
    assert set(issue.keys()) >= {'title', 'text', 'milestone', 'labels'} 
    assert '/estimate' in issue.text, f'no time estimate for "{issue.title}"'
    assert '"' not in issue.text, f'cannot handle double quotes'
    assert '"' not in issue.title, f'cannot handle double quotes'
    for key, value in issue.items():
        assert value is not None, f'got None for {key}'
    base = ['lab', 'issue', 'create', remote]
    lines = ['-m', issue.title]

    for line in issue.text.splitlines():
        lines.append('-m')
        lines.append(line)

    milestone = ['-m', f'/milestone %{issue.milestone}']
    labels = [ '-l', ','.join(issue.labels) ]


    command = base + lines + milestone + labels
    pprint.pprint([issue.title, list(issue.labels), issue.milestone, f'{len(issue.text)} characters'])
    # print(f'creating: {issue.title}, labels: {issue.labels}, milestone: {issue.milestone}, {len(issue.text)} characters')
    run(command)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('remote', metavar='REMOTE', help='name of git remote to use')
    parser.add_argument('yaml_file', metavar='YAML_FILE')
    parser.add_argument('--dry-run', action='store_true')
    arguments = parser.parse_args()
    dryable.set(arguments.dry_run)
    issues = list(yaml.safe_load_all(open(arguments.yaml_file)))
    for issue in issues:
        issue = box.Box(issue)
        create(issue, arguments.remote)

    print()
    print(f'total of {len(issues)} issues')

main()




