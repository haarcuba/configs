#!/usr/bin/env python3
import pathlib
import requests
import yaml
import dryable
import sys
import pprint
import box
import argparse
import logging

def show(issue, file=sys.stdout):
    pprint.pprint([issue.title, list(issue.labels), issue.milestone, f'{len(issue.text)} characters'], stream=file)

def verify_correctness(issue):
    if not (set(issue.keys()) >= {'title', 'text', 'milestone', 'labels'}):
        logging.error(f'missing some fields for "{issue.title}"')
        return False
    if '/estimate' not in issue.text:
        logging.error(f'no time estimate for "{issue.title}"')
        return False
    for key, value in issue.items():
        if value is None:
            logging.error(f'{key} is None for "{issue.title}"')
            return False

    return True

class Gitlab:
    def __init__(self, token, project):
        logging.info(f'token={token} project={project}')
        self._project = project
        self._session = requests.session()
        self._session.headers['Authorization'] = f'Bearer {token}'
        self._load_milestones()

    def _load_milestones(self):
        response = self._session.get( self._url(f'/projects/{self._project}/milestones') )
        response.raise_for_status()
        all = response.json()
        self._milestones = { milestone['title']: milestone['id'] for milestone in all }
        logging.info(f'milestones: {list(self._milestones.keys())}')

    def _url(self, path):
        return f'https://gitlab.com/api/v4{path}'

    @dryable.Dryable()
    def create_issue(self, title, text, labels, milestone):
        milestone_id = self._milestones[milestone]
        details = dict(title=title, description=text, labels=','.join(labels), milestone_id=milestone_id)
        response = self._session.post(self._url(f'/projects/{self._project}/issues'), json=details)
        return response

def create(gitlab, issue):
    if not verify_correctness(issue):
        return False

    return gitlab.create_issue(issue.title, issue.text, issue.labels, issue.milestone)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--config-file', metavar='YAML_FILE', help='configuration for this tool', type=pathlib.Path, default=pathlib.Path.home() / '.create_issues.yaml')
    parser.add_argument('yaml_file', metavar='YAML_FILE')
    parser.add_argument('--dry-run', action='store_true')
    parser.add_argument('--debug', action='store_true')
    arguments = parser.parse_args()
    configuration = yaml.safe_load(arguments.config_file.read_text())
    logging.basicConfig(format='%(asctime)s %(levelname)s: %(message)s', level=logging.INFO)
    dryable.set(arguments.dry_run)
    issues = list(yaml.safe_load_all(open(arguments.yaml_file)))
    errors = []
    gitlab = Gitlab(configuration['token'], configuration['project'])
    for issue in issues:
        issue = box.Box(issue)
        if issue.get('skip', False):
            print(f'skipping "{issue.title}"')
        response = create(gitlab, issue)
        if not response.ok:
            errors.append(box.Box(issue=issue, response=response))

        break

    print()
    print(f'total of {len(issues)} issues')
    print(f'total errors: {len(errors)}')
    for error in errors:
        show(error.issue, file=sys.stderr)

    if arguments.debug:
        import IPython
        IPython.embed()

main()
