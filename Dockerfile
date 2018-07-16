FROM python:3.6.3

# Supervisor setup
RUN apt-get update && apt-get install -y supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# App setup
ADD . /app
RUN pip install -r /app/requirements.txt

# Airflow setup
ENV AIRFLOW_HOME=/app/airflow
RUN pip install apache-airflow
COPY /dags/response_rate_etl.py $AIRFLOW_HOME/dags/
RUN airflow initdb
EXPOSE 8080

# AWS setup
ENV AWS_DEFAULT_REGION=us-east-1

CMD ["/usr/bin/supervisord"]