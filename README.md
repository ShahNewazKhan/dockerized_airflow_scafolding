# Dockerized Airflow 
This repo is the scaffolding for a Dockerized Airflow container

## Setup 

### Docker build
Build the image to your local docker repo
```sh
docker build . -t airflow
``` 

```sh
### Run docker container 

Launch the docker contianer, this will spin up the `Airflow Scheduler` & the `Airflow Webserver` at `localhost:8080`
```sh
# run container named rr_etl in detached mode and remove at exit 
docker run -d -p 8080:8080 --rm \
   --name airflow_container \
   airflow
```

### Launch Airflow dashboard

Launch the Airflow dashboard by browsing to `localhost:8080`
