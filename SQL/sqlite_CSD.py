# Based on:
# https://www.coursera.org/learn/sql-data-science/ungradedLti/uCNuW/hands-on-lab-3-analyzing-a-real-world-data-set
# https://www.dataquest.io/blog/python-pandas-databases/
# https://stackoverflow.com/questions/14431646/how-to-write-pandas-dataframe-to-sqlite-with-index

import pandas
import sqlite3
import matplotlib.pyplot as plt
#import seaborn as sns

#Pull CSD (Chicago Socioeconomic Data) into Pandas dataframe
CSD = pandas.read_csv('https://data.cityofchicago.org/resource/jcxq-k9xf.csv')
print(CSD.iloc[:5])

# Establish connection to local database
conn = sqlite3.connect('./sqlite_CSD.db') # Create database
cur = conn.cursor()

# Drop table
cur.execute('''DROP TABLE IF EXISTS CSD''')
print(cur.fetchall())

# Write the Pandas dataframe to sqlite3 database
CSD.to_sql('CSD', conn, if_exists='replace', index=False)

# Verify that the table creation was succesfull:
cur.execute('select * from CSD limit 5;')
print(cur.fetchall())

# How many rows are in the dataset?
cur.execute('SELECT COUNT(*) FROM CSD;')
print(cur.fetchall())

# How many community areas in Chicago have a hardship index greater than 50.0?
cur.execute('SELECT COUNT(*) FROM CSD WHERE hardship_index > 50.0;')
print(cur.fetchall())

# What is the maximum value of hardship index in this dataset?
cur.execute('SELECT MAX(hardship_index) FROM CSD')
print(cur.fetchall())

# Which community area which has the highest hardship index?

## We can use the result of the last query as an input to this query:
cur.execute('SELECT community_area_name FROM CSD where hardship_index=98.0')
print(cur.fetchall())

## or you can use a sub-query to determine the max hardship index:
cur.execute('select community_area_name from CSD where hardship_index = ( select max(hardship_index) from CSD )')
print(cur.fetchall())

# Which Chicago community areas have per-capita incomes greater than $60,000?
cur.execute('SELECT community_area_name FROM CSD WHERE per_capita_income_ > 60000;')
print(cur.fetchall())


# scatterplot:
# income_vs_hardship = cur.execute('SELECT per_capita_income_, hardship_index FROM CSD;')
cur.execute('SELECT per_capita_income_, hardship_index FROM CSD;')
print(cur.fetchall())
#plot = sns.jointplot(x='per_capita_income_',y='hardship_index', data=income_vs_hardship.DataFrame())

cur.close()
conn.close()

