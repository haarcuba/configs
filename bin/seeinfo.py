#!/usr/bin/python
import pathlib
import subprocess
import yaml
import argparse
import tempfile
import os
import sys

def seeInfo(stdout, info_file):
    info = subprocess.check_output(f'gpg -d {info_file}', shell=True, close_fds=True, text=True)
    if stdout:
        sys.stdout.write(info)
        return
    vimProcess = subprocess.Popen('vim -', stdin=subprocess.PIPE, shell=True, close_fds=True, text=True)
    vimProcess.communicate(info)
    vimProcess.wait()

class EditInfo:
    def __init__(self, info_file, gpg_recepient):
        self._info_file = info_file
        self._gpg_recepient = gpg_recepient
        self._backup()
        self._working_file = tempfile.mktemp()
        try:
            self._decrypt()
            self._edit()
            self._encrypt()
        finally:
            os.unlink(self._working_file)

    def _backup(self):
        subprocess.check_call(f'cp {self._info_file} {self._info_file}.backup', shell=True, close_fds=True)

    def _decrypt(self):
        subprocess.check_call(f'gpg -o {self._working_file} -d {self._info_file}', shell=True, close_fds=True)
    
    def _edit(self):
        subprocess.check_call(f'vim {self._working_file}', shell=True, close_fds=True)

    def _encrypt(self):
        subprocess.check_call(f'gpg -r {self._gpg_recepient} -o {self._info_file} -e {self._working_file}', shell=True, close_fds=True)


parser = argparse.ArgumentParser()
parser.add_argument('--config-file', '-c', default=f'{pathlib.Path.home()}/.seeinfo.yaml', help='the config file')
parser.add_argument('--edit', '-e', action='store_true', help='edit the file, not just view')
parser.add_argument('--stdout', '-s', action='store_true', help='in view mode - dump contents to stdout')
arguments = parser.parse_args()
configuation = yaml.safe_load(open(arguments.config_file))
encrypted_info_file = configuation['encrypted_info_file']
gpg_recepient = configuation['gpg_recepient']

if arguments.edit:
    EditInfo(encrypted_info_file, gpg_recepient)
else:
    seeInfo(arguments.stdout, encrypted_info_file)
