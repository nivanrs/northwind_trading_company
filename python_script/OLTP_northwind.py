import os
import pandas as pd
from sqlalchemy import create_engine

# Database connection
db_url = 'postgresql://postgres:12345678@localhost:5432/db_project_northwind'
engine = create_engine(db_url)

# Directory containing CSV files
csv_dir = r'../northwind_CSV'

# List of CSV files and corresponding table names
csv_files = {
    'categories.csv': 'categories',
    'employees.csv': 'employees',
    'suppliers.csv': 'suppliers',
    'products.csv': 'products',
    'orders.csv': 'orders',
    'order_details.csv': 'order_details'
}

# Load each CSV file into PostgreSQL
for file, table in csv_files.items():
    file_path = os.path.join(csv_dir, file)
    df = pd.read_csv(file_path)
    df.to_sql(table, engine, if_exists='fail', index=False)

print("All CSV files have been loaded into PostgreSQL.")

