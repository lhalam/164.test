<h1>FOR TESTING DB SCRIPTS:</h1>
<ol>
    <li>clone this branch</li>
    <li>open query.py and set your msql password:</li>
    db = MySQLdb.connect("localhost", 'root', password, 'test')<br>
    * if necessary change host, db_user, database_name 
    <br>
    <li>open db_script.py and change PATH to your working directory:</li>
      (ex) PATH = '/home/padalko/ss_projects/164.test'</li>
    <li>run python db_script.py</li>  
</ol>


<h2>query.py</h2>
USE function make_query(sql, table) for having nice output in console!
<ul>
    <li> 'sql' is your query to DB in sql</li>
    <li> 'table' the name of the table in DB (it isn't necessary to define it, but i am strongly recommend)</li>
</ul>    
example: make_query("select * from Region where RegionID ='3' ", 'Region')

<h4>to see table info use:</h4>
<ul>
 <li>just the list of tables
    --> pprint(tables) </li>
 <li>list of all tables with additional info
    --> pprint(map(show_full_table_info, tables)) </li>
 <li>detailed info about specific table
    --> pprint(show_full_table_info('<table_name>')) </li>
</ul>
!!!not fully tested yet!!!

