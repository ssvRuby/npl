import happybase


# server_name = 'node2.newprolab.com'
server_name = 'horton1.ssv.home.internal'
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



