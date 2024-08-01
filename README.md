DBT project

sample data from https://openflights.org/data?lang=en_US#schedule

To run the project, run the following commands:<br>
`docker-compose up`<br>
`python -m venv venv`<br>
`python/Scripts/activate`<br>
`pip install -r requirements.txt`<br>



DBT project commands<br>
1. `dbt seed`<br>
2. `dbt run-operation create_flight_table`<br>
3. `dbt run-operation create_data_generation_function`<br>
4. `dbt run --select staging.stg_route`<br>
5. `dbt run-operation call_data_generation_function`<br>
6. `dbt run --select +facts.fact_flight`<br>


DBT commands:<br>
`dbt run` - to run all models<br>
`dbt run --select {model_name}` - to run selected model<br>
`dbt run --select +{model_name}` - to run all models on which it depends selected model<br>
`dbt run --select {model_name}+` - to run all models which depend on selected model<br>
`dbt seed` - to load files in seed folder as model into database<br>
`dbt test` - to run all tests<br>
`dbt docs generate` - to genereate documentation<br>
`dbt docs serve` - for opening documentation<br>