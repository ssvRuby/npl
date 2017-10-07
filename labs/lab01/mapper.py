import sys


def do_map(record):
    ip, user_id, country, banner_id, payout = record.split(",")
    payout = float(payout)
    yield country, payout


for line in sys.stdin:
    if len(line.split(",")) >= 5:
        for key, value in do_map(line):
            print(key + "\t" + str(value))


