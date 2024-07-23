DBT project

https://openflights.org/data?lang=en_US

`dbt run` - to run all models
`dbt run --select {model_name}` - to run selected model
`dbt run --select +{model_name}` - to run all models on which it depends selected model
`dbt run --select {model_name}+` - to run all models which depend on selected model
`dbt seed` - to load files in seed folder as model into database
`dbt test` - to run all tests
`dbt docs generate` - to genereate documentation
`dbt docs serve` - for opening documentation
