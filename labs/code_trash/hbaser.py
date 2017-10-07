import happybase


file_name = ''
server_name = 'node2.newprolab.com'
#server_name = 'horton1.ssv.home.internal'
table_name = 'sergey.sirosh'

def create_table(conn, table_name):
    conn.create_table(
        table_name,
        {'data:url': dict(max_versions=4096)}
    )



try:

    conn = happybase.Connection(server_name)
    print('Connection is')
except:
    print('Connection isNot')

create_table(conn, table_name)

#
# if conn:
#     #create_table(conn, table_name)
#     # table = conn.table(table_name)
#     #
#     # if table:
#     #     with open('part-00000') as file:
#     #         for line in file:
#     #             uid, ts, url = line.split('\t')
#     #             ts_num = int(float(ts) * 1000)
#     #             print(uid, ' ', ts_num)
#     #
#     #             table.put(uid, {'sv:data': url}, timestamp=ts_num)
#
#     # url = 'http%3A//www.eg.ru/daily/worldstars/'
# uid = '2629965538'
# table = conn.table(table_name)
#     # for i in range(0, 4086):
#     #    table.put(uid, {'data:url': url})
#
# print(len(table.cells(uid, 'data:url')))
#
#     conn.close()
#
# # table = conn.table(table_name)
# # table.put(b'row-key', {b'data': b'value1'}, timestamp=123456789)
