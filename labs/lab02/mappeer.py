import sys
from decimal import Decimal
import happybase

server_name = 'node2.newprolab.com'
table_name = 'sergey.sirosh'

conn = happybase.Connection(server_name)
table = conn.table(table_name)

for line in sys.stdin:

    uid = ''
    ts = ''
    url = ''
    line = line.replace('\n', '', )

    try:
        uid, ts, url = line.split('\t')
    except ValueError:
        continue

    if '-' in uid or '-' in ts or url == '':
        continue

    try:
        uid_num = Decimal(uid.strip())
        ts_num = float(ts.strip())
    except:
        continue

    if uid_num % 256 != 226:
        continue

    table.put(uid, {'data:url': url}, timestamp=int(ts_num * 1000))

    print(uid + '\t' + str(int(ts_num * 1000)))

conn.close()
