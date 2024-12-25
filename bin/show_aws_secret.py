import boto3
import json
import yaml
import argparse
import os

def get_secret(secret_name, dumper):
   session = boto3.session.Session()
   client = session.client(service_name='secretsmanager')
   response = client.get_secret_value(SecretId=secret_name)
   secret_json = json.loads(response['SecretString'])
   print(dumper(secret_json))
   return secret_json


def yaml_dump(data):
   return yaml.dump(data, default_flow_style=False)

def json_dump(data):
    return json.dumps(data, indent=2)

def main():
   parser = argparse.ArgumentParser(description='Fetch AWS secret and output as YAML')
   parser.add_argument('secret_name', help='Name of the secret to retrieve')
   parser.add_argument('--format', help='Output format (default: yaml)', default='yaml')
   
   arguments = parser.parse_args()
   dumpers = {'yaml': yaml_dump, 'json': json_dump}
   dumper = dumpers[arguments.format]

   get_secret(arguments.secret_name, dumper)

if __name__ == "__main__":
   main()
