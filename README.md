
USE make_query(sql, table) for having nice output in console!
    - '<sql>' is your query to DB in sql
    - '<table>' the name of the table in DB (it isn't necessary to define it, but i am strongly recommend)
example: make_query("select * from Region where RegionID ='3' ", 'Region')

to see table info use:
1 just the list of tables
    # pprint(tables)
2 list of all tables with additional info
    # pprint(map(show_full_table_info, tables))
3 detailed info about specific table
    # pprint(show_full_table_info('<table_name>'))

!!!not fully tested yet!!!

FOR TESTING DB SCRIPTS:
    1.clone this branch
    2.open query.py and set your msql password
    3.open db_script.py and change PATH to your working directory:
      (ex) PATH = '/home/padalko/ss_projects/164.test'
    4. run python db_script.py  