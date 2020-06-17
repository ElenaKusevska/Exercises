# Based on:
# https://www.coursera.org/learn/sql-data-science/ungradedLti/uCNuW/hands-on-lab-3-analyzing-a-real-world-data-set
# https://www.dataquest.io/blog/python-pandas-databases/
# https://stackoverflow.com/questions/14431646/how-to-write-pandas-dataframe-to-sqlite-with-index

import pandas
import sqlite3

#Pull CSD (Chicago Socioeconomic Data) into Pandas dataframe
CSD = pandas.read_csv('https://data.cityofchicago.org/resource/jcxq-k9xf.csv')
print(CSD.iloc[:5])

# Establish connection to local database
conn = sqlite3.connect('./sqlite_CSD.db') # Create database
cur = conn.cursor()

# Drop table
cur.execute('''DROP TABLE IF EXISTS CSD''')
results = cur.fetchall()
print(results)

# Write the Pandas dataframe to sqlite3 database
CSD.to_sql('CSD', conn, if_exists='replace', index=False)
cur.execute('select * from CSD limit 5;')
results = cur.fetchall()
print(results)

cur.close()
conn.close()

