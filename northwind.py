# # coding=utf-8
from __future__ import print_function
from pprint import pprint
import MySQLdb
from settings import password

db = MySQLdb.connect("localhost", 'root', password, 'Northwind')
COLUMN_INFO = [
    'Field',
    'Type',
    'Null',
    'Key',
    'Default',
    'Extra'
]


def reduce_seq(seq):
    res = []
    for item in seq:
        if hasattr(item, '__iter__'):
            for x in item:
                res.append(x)
        else:
            res.append(item)
    return res


def make_dict(keys, vals):
    result = dict(zip(keys, vals))
    extra_keys = set(keys) - set(result.iterkeys())
    if extra_keys:
        for key in extra_keys:
            result[key] = None
    return result


def show_full_table_info(table):
    q = db.cursor()
    q.execute("show columns FROM %s;" % table)
    qs = q.fetchall()
    detailed_qs = ([make_dict(COLUMN_INFO, row) for row in qs if qs])
    output_query = {}
    for dct in detailed_qs:
        table_field_key = dct.pop('Field')
        output_query[table_field_key] = {}
        output_query[table_field_key].update((k.upper(), v) for (k, v) in dct.iteritems())
        output_query[table_field_key]['__TABLE_NAME__'] = table
    return output_query

get_tables = db.cursor()
get_tables.execute('show tables;')
tables = reduce_seq(get_tables.fetchall())


def make_query(sql, table=None):
    """

    :rtype : list of dictionaries
    """
    qs = db.cursor()
    qs.execute("%s" % sql)
    values = qs.fetchall()
    result = []
    if table:
        get_table_info = db.cursor()
        get_table_info.execute("show columns FROM %s;" % table)
        keys = get_table_info.fetchall()
        parsed_keys = [x[0] for x in keys if keys]
        for val in values:
            result.append(dict(zip(parsed_keys, val)))
        return result
    else:
        for val in values:
            result.append(val)
        return result

pprint(make_query("select * from Region", 'Region'))
pprint(show_full_table_info('Region'))

# pprint(map(show_full_table_info, tables))