import sys


for line in sys.stdin:
    uid, ts, url = '', '', ''
    line = line.replace('\n', '', )
    try:
        uid, ts, url = line.split('\t')
    except ValueError:
        continue
    if '-' in uid or '-' in ts or url == '':
        continue

    print(url + '\t' + '1')


