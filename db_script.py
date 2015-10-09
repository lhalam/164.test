# # coding=utf-8
from mysql.connector import OperationalError, ProgrammingError
import re
from query import *

PATH = '/home/padalko/ss_projects/164.test'
SQL_TABLES = [
    '{}/db/test.sql'.format(PATH),
    '{}/db/table2.sql'.format(PATH),
    '{}/db/table3.sql'.format(PATH)
]


def exec_sql_file(cursor, sql_file):
    print "\n[INFO] Executing SQL script file: '%s'" % (sql_file)
    sql_statement = ""
    for line in open(sql_file):
        if re.match(r'--', line):  # ignore sql comment lines
            continue
        if not re.search(r'[^-;]+;', line):  # keep appending lines that don't end in ';'
            sql_statement += line
        else:  # when you get a line ending in ';' then exec statement and reset for next statement
            sql_statement += line
            # print "\n\n[DEBUG] Executing SQL statement:\n%s" % (sql_statement)
            try:
                cursor.execute(sql_statement)
            except (OperationalError, ProgrammingError) as e:
                print "\n[WARN] MySQLError during execute statement \n\tArgs: '%s'" % (str(e.args))
            sql_statement = ""
#
# for sql_file in SQL_TABLES:
#     exec_sql_file(db.cursor(), sql_file)
# map(exec_sql_file(db.cursor(), SQL_TABLES), SQL_TABLES)
exec_sql_file(db.cursor(), '{}/db/all_sql_in_one.sql'.format(PATH))
# exec_sql_file(db.cursor(), '{}/db/table2.sql'.format(PATH))
# exec_sql_file(db.cursor(), '{}/db/table3.sql'.format(PATH))
print 'Users:'
pprint(make_query('select * from Users;', 'Users'))
print 'Problems:'
pprint(make_query('select * from Problems;', 'Problems'))
print 'All tables:'
pprint(tables)
# pprint(show_full_table_info('Photos'))
# pprint(map(show_full_table_info, tables))
db.close()