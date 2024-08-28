#!/usr/bin/env python
import json
import argparse
import sys

def recursive_json_decode(obj):
    if isinstance(obj, dict):
        return {k: recursive_json_decode(v) for k, v in obj.items()}
    elif isinstance(obj, list):
        return [recursive_json_decode(elem) for elem in obj]
    elif isinstance(obj, str):
        try:
            return recursive_json_decode(json.loads(obj))
        except json.JSONDecodeError:
            return obj
    else:
        return obj

def main():
    parser = argparse.ArgumentParser(description="Recursively decode JSON strings in a JSON object, reads from stdin")
    parser.parse_args()
    input_json = sys.stdin.read()

    try:
        parsed_json = json.loads(input_json)
        result = recursive_json_decode(parsed_json)
        print(json.dumps(result, indent=2))
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
