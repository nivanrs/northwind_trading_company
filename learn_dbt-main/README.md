# learn_dbt

## How to run it?

create a virtual env of python first :

```
python3 -m venv <your directory>, exp : python3 -m venv /Users/moladin/code/venv_ds
source <your directory>, exp : source /Users/moladin/code/venv_ds/bin/activate
```

1. build the postgres image

```
docker build -t {postgres_image_name} -f Dockerfile.postgres .

ex: docker build -t dbt_proj -f Dockerfile.postgres .
```

2. run postgres container
   if you want to check the result on local (uncomment first the EXPOSE command on dockerfile postgres)

```
docker run -d -p 5432:5432 --name {postgres_container_name} {postgres_image_name}

if 5432 alrerady used, do: sudo pkill -u postgres

ex: docker run -d -p 5432:5432 --name dbt_proj_container dbt_proj

```

2a. install DBT
python -m pip install dbt-core dbt-postgres

```

```

3. debug your dbt connection

```
dbt debug --profiles-dir ./ --project-dir dbt_dskola_project
```

4. run dbt model

```
dbt run --profiles-dir ./ --project-dir dbt_dskola_project
```

5. generate dbt docs

```
dbt docs generate --profiles-dir ./ --project-dir dbt_dskola_project
```

6. serve dbt docs

```
dbt docs serve --profiles-dir ./ --project-dir dbt_dskola_project
```
