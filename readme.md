# Project_northwind

## How to run it?

1. create a virtual env of python first :

```
python3 -m venv <your directory>, exp : python3 -m venv /Users/moladin/code/venv_ds
source <your directory>, exp : source /Users/moladin/code/venv_ds/bin/activate
python -m pip install dbt-core dbt-postgres pandas sqlalchemy

```

```
This folder contain learn project and main project
```

2. Clone data file from https://github.com/graphql-compose/graphql-compose-examples.git to obtain csv file
3. create init_db folder with init.sql file to create table based on obtained csv files

4. Create dockerfile of postgres to create OLTP detabase.

build the postgres image

```
docker build -t northwind_project_image -f Dockerfile.postgres .

ex: docker build -t dbt_proj -f Dockerfile.postgres .
```

5. run postgres container
   if you want to check the result on local (uncomment first the EXPOSE command on dockerfile postgres)

```
docker run -d -p 5432:5432 --name northwind_project_container northwind_project_image

if 5432 alrerady used, do: sudo pkill -u postgres

6. initialize dbt with: dbt init project_northwind
fill and match with previous information written in docker to create profile.yaml. For example:

      dbname: db_project_northwind
      host: localhost
      pass: '12345678'
      port: 5432
      schema: public
      threads: 1
      type: postgres
      user: postgres

7. run OLTP_northwind.py to dill the database with data
```

8. actual project in project dbt
