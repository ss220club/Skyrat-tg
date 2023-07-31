import sys
import json

if len(sys.argv) <= 1:
    exit(1)

status = 0

for file in sys.argv[1:]:
    with open(file, encoding="ISO-8859-1") as f:
        try:
            if file.startswith("ss220"):
                print("SS220 exception detected, passing...")
            else:
                json.load(f)
        except ValueError as exception:
            print("JSON error in {}".format(file))
            print(exception)
            status = 1
        else:
            print("Valid {}".format(file))

exit(status)
