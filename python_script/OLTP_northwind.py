import os
import pandas as pd
from sqlalchemy import create_engine

# Database connection
db_url = 'postgresql://postgres:12345678@localhost:5432/db_project_northwind'
engine = create_engine(db_url)

# Directory containing CSV files
csv_dir = r'../northwind_CSV'

# List all CSV files in the directory
csv_files = [f for f in os.listdir(csv_dir) if f.endswith('.csv')]

# Load each CSV file into PostgreSQL
for file in csv_files:
    file_path = os.path.join(csv_dir, file)
    table_name = file.replace('.csv', '')
    df = pd.read_csv(file_path)
    df.to_sql(table_name, engine, if_exists='replace', index=False)

print("All CSV files have been loaded into PostgreSQL.")
